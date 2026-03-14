# Ghost Toolkit - DigitalOcean Practice Lab Terraform Configuration

terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc1"
}

variable "attack_size" {
  description = "Droplet size for attack machine"
  type        = string
  default     = "s-4vcpu-8gb"
}

variable "target_size" {
  description = "Droplet size for target machines"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "ssh_key_id" {
  description = "SSH Key ID"
  type        = string
  default     = ""
}

# SSH Key (optional - will create if not provided)
resource "digitalocean_ssh_key" "ghost" {
  name       = "ghost-lab-key"
  public_key = var.ssh_key_id != "" ? "" : file("~/.ssh/id_rsa.pub")
}

# VPC
resource "digitalocean_vpc" "ghost_network" {
  name   = "ghost-vpc"
  region = var.region
  ip_range = "10.0.0.0/16"
}

# Droplet - Attack Machine
resource "digitalocean_droplet" "attack" {
  name     = "ghost-attack"
  image    = "ubuntu-22-04-x64"
  size     = var.attack_size
  region   = var.region
  vpc_uuid = digitalocean_vpc.ghost_network.id
  
  ssh_keys = var.ssh_key_id != "" ? [var.ssh_key_id] : [digitalocean_ssh_key.ghost.id]
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y git python3 python3-pip curl wget
              git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
              cd ghost-toolkit-scripts
              chmod +x ghost_setup.sh
              EOF
  
  tags = ["ghost", "attack"]
}

# Droplet - Target 1 (Vulnerable Web App)
resource "digitalocean_droplet" "target_web" {
  name     = "ghost-target-web"
  image    = "ubuntu-22-04-x64"
  size     = var.target_size
  region   = var.region
  vpc_uuid = digitalocean_vpc.ghost_network.id
  
  ssh_keys = var.ssh_key_id != "" ? [var.ssh_key_id] : [digitalocean_ssh_key.ghost.id]
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker docker-compose
              # Install DVWA or other vulnerable apps
              EOF
  
  tags = ["ghost", "target", "webapp"]
}

# Droplet - Target 2 (Linux Target)
resource "digitalocean_droplet" "target_linux" {
  name     = "ghost-target-linux"
  image    = "ubuntu-22-04-x64"
  size     = var.target_size
  region   = var.region
  vpc_uuid = digitalocean_vpc.ghost_network.id
  
  ssh_keys = var.ssh_key_id != "" ? [var.ssh_key_id] : [digitalocean_ssh_key.ghost.id]
  
  tags = ["ghost", "target", "linux"]
}

# Firewall - Allow SSH from anywhere
resource "digitalocean_firewall" "ghost_fw" {
  name = "ghost-firewall"
  
  droplet_ids = [digitalocean_droplet.attack.id]
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }
  
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }
  
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
  
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
}

# Outputs
output "attack_ip" {
  value = digitalocean_droplet.attack.ipv4_address
}

output "target_web_ip" {
  value = digitalocean_droplet.target_web.ipv4_address
}

output "target_linux_ip" {
  value = digitalocean_droplet.target_linux.ipv4_address
}

output "instructions" {
  value = <<-EOT
  After terraform apply:
  
  1. SSH to attack machine:
     ssh root@${digitalocean_droplet.attack.ipv4_address}
  
  2. Run setup:
     cd ghost-toolkit-scripts && sudo ./ghost_setup.sh
  
  3. Targets:
     - Web: ssh root@${digitalocean_droplet.target_web.ipv4_address}
     - Linux: ssh root@${digitalocean_droplet.target_linux.ipv4_address}
  EOT
}
