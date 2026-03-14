FROM ubuntu:22.04

LABEL maintainer="Joe Munene <joemunene@email.com>"
LABEL description="Ghost Toolkit - Cybersecurity Penetration Testing Framework"

ENV DEBIAN_FRONTEND=noninteractive
ENV GHOST_HOME=/root/ghost_toolkit
ENV GHOST_SCRIPTS=/ghost_scripts

# Install core dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    curl \
    wget \
    build-essential \
    sudo \
    tmux \
    vim \
    net-tools \
    iputils-ping \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Install network tools
RUN apt-get update && apt-get install -y \
    nmap \
    masscan \
    netcat-openbsd \
    socat \
    && rm -rf /var/lib/apt/lists/*

# Install web security tools
RUN apt-get update && apt-get install -y \
    nikto \
    dirb \
    gobuster \
    whatweb \
    && rm -rf /var/lib/apt/lists/*

# Install password tools
RUN apt-get update && apt-get install -y \
    hydra \
    john \
    hashcat \
    && rm -rf /var/lib/apt/lists/*

# Install forensics tools
RUN apt-get update && apt-get install -y \
    steghide \
    binwalk \
    libimage-exiftool-perl \
    foremost \
    imagemagick \
    binutils \
    && rm -rf /var/lib/apt/lists/*

# Install other tools
RUN apt-get update && apt-get install -y \
    sslscan \
    aircrack-ng \
    tor \
    proxychains4 \
    unzip \
    zip \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*

# Install Go for certain tools
RUN apt-get update && apt-get install -y \
    golang \
    && rm -rf /var/lib/apt/lists/*

# Install SQLMap
RUN pip3 install --no-cache-dir sqlmap

# Install Nuclei
RUN pip3 install --no-cache-dir nuclei

# Install SecLists
RUN mkdir -p /usr/share/wordlists && \
    cd /usr/share/wordlists && \
    wget -q https://github.com/danielmiessler/SecLists/archive/master.zip -O seclists.zip && \
    unzip -q seclists.zip && \
    mv SecLists-master/* . && \
    rm -rf SecLists-master seclists.zip

# Clone Ghost Toolkit Repos
RUN mkdir -p $GHOST_HOME && \
    cd $GHOST_HOME && \
    git clone --depth 1 https://github.com/joemunene-by/Port-scanner && \
    git clone --depth 1 https://github.com/joemunene-by/advanced-port-scanner && \
    git clone --depth 1 https://github.com/joemunene-by/Hash-Cracker-Dictionary-Brute- && \
    git clone --depth 1 https://github.com/joemunene-by/mac-spoofer && \
    git clone --depth 1 https://github.com/joemunene-by/sentinelpulse && \
    git clone --depth 1 https://github.com/joemunene-by/Steganography-tool && \
    git clone --depth 1 https://github.com/joemunene-by/Network-Traffic-Analyzer && \
    git clone --depth 1 https://github.com/joemunene-by/metadata-scrubber-tool && \
    git clone --depth 1 https://github.com/joemunene-by/Vulnerabilities-Scanner

# Create directories
RUN mkdir -p $GHOST_HOME/scans $GHOST_HOME/payloads /scans /payloads

# Copy toolkit scripts
COPY ghost_setup.sh $GHOST_SCRIPTS/
COPY ghost_launcher.sh $GHOST_SCRIPTS/
COPY ghost_update.sh $GHOST_SCRIPTS/
COPY ghost_monitor.sh $GHOST_SCRIPTS/
COPY tools/ $GHOST_SCRIPTS/tools/
COPY config/ $GHOST_SCRIPTS/config/

RUN chmod +x $GHOST_SCRIPTS/*.sh $GHOST_SCRIPTS/tools/**/*.sh

# Set working directory
WORKDIR $GHOST_SCRIPTS

# Create non-root user
RUN useradd -m -s /bin/bash ghost && \
    chown -R ghost:ghost $GHOST_HOME $GHOST_SCRIPTS /scans /payloads

USER ghost

# Default command
CMD ["./ghost_launcher.sh"]
