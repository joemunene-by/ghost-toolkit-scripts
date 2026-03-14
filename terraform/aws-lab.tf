# Ghost Toolkit - AWS Practice Lab Terraform Configuration
# Creates a penetration testing practice environment on AWS

terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Configure AWS provider
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Project     = "Ghost-Toolkit-Lab"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

# Variables
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "pentest-lab"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "allowed_ip" {
  description = "Your IP for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "ghost-lab-key"
}

variable "ami_id" {
  description = "Ubuntu AMI ID (will use default if not specified)"
  type        = string
  default     = ""  # Will be looked up if empty
}

# Lookup Ubuntu 22.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "ghost-toolkit-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "ghost-toolkit-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  map_public_ip_on_launch = true
  
  tags = {
    Name = "ghost-toolkit-public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, 2)
  
  tags = {
    Name = "ghost-toolkit-private-subnet"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name = "ghost-toolkit-public-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group - Kali/Attack Machine
resource "aws_security_group" "attack" {
  name        = "ghost-attack-sg"
  description = "Security group for attack machine"
  vpc_id      = aws_vpc.main.id
  
  # SSH access
  ingress {
    from_ip_protocol = "tcp"
    to_port          = 22
    cidr_blocks      = [var.allowed_ip]
    description      = "SSH"
  }
  
  # All outbound
  egress {
    from_ip_protocol = "-1"
    to_port          = -1
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "All outbound"
  }
  
  tags = {
    Name = "ghost-attack-sg"
  }
}

# Security Group - Target Machines
resource "aws_security_group" "target" {
  name        = "ghost-target-sg"
  description = "Security group for target machines"
  vpc_id      = aws_vpc.main.id
  
  # Allow traffic from attack subnet
  ingress {
    from_ip_protocol = "-1"
    to_port          = -1
    cidr_blocks      = [var.vpc_cidr]
    description      = "Internal traffic"
  }
  
  # SSH from outside (for management)
  ingress {
    from_ip_protocol = "tcp"
    to_port          = 22
    cidr_blocks      = [var.allowed_ip]
    description      = "SSH"
  }
  
  egress {
    from_ip_protocol = "-1"
    to_port          = -1
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "All outbound"
  }
  
  tags = {
    Name = "ghost-target-sg"
  }
}

# EC2 - Attack Machine (Kali Linux)
resource "aws_instance" "attack" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public.id
  
  vpc_security_group_ids = [aws_security_group.attack.id]
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y git python3 python3-pip
              git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
              cd ghost-toolkit-scripts
              chmod +x ghost_setup.sh
              # Don't run automatically - requires sudo
              EOF
  
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  
  tags = {
    Name = "ghost-attack-machine"
    Role = "Attacker"
  }
}

# EC2 - Target 1 (Vulnerable Web App)
resource "aws_instance" "target_web" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name      = var.key_name
  subnet_id     = aws_subnet.private.id
  
  vpc_security_group_ids = [aws_security_group.target.id]
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker docker-compose
              # DVWA could be installed here
              EOF
  
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
  
  tags = {
    Name = "ghost-target-web"
    Role = "Target-WebApp"
  }
}

# EC2 - Target 2 (Linux Target)
resource "aws_instance" "target_linux" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name      = var.key_name
  subnet_id     = aws_subnet.private.id
  
  vpc_security_group_ids = [aws_security_group.target.id]
  
  tags = {
    Name = "ghost-target-linux"
    Role = "Target-Linux"
  }
}

# Outputs
output "attack_machine_ip" {
  description = "Public IP of attack machine"
  value       = aws_instance.attack.public_ip
}

output "attack_machine_private_ip" {
  description = "Private IP of attack machine"
  value       = aws_instance.attack.private_ip
}

output "target_web_ip" {
  description = "Private IP of web target"
  value       = aws_instance.target_web.private_ip
}

output "target_linux_ip" {
  description = "Private IP of linux target"
  value       = aws_instance.target_linux.private_ip
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "login_instructions" {
  description = "Login instructions"
  value       = <<-EOT
  After terraform apply:
  
  1. SSH to attack machine:
     ssh -i your-key.pem ubuntu@${aws_instance.attack.public_ip}
  
  2. Run ghost setup:
     cd ghost-toolkit-scripts
     sudo ./ghost_setup.sh
  
  3. Target machines (from attack machine):
     - Web: ssh ubuntu@${aws_instance.target_web.private_ip}
     - Linux: ssh ubuntu@${aws_instance.target_linux.private_ip}
  EOT
}
