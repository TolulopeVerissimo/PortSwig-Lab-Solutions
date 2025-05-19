# Use a stable Debian base image
FROM debian:bookworm

# Use bash as the default shell
SHELL ["/bin/bash", "-c"]

# Prevent interactive prompts during build
ARG DEBIAN_FRONTEND=noninteractive

# Install system dependencies and Java
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    firefox-esr \
    apt-utils \
    iputils-ping \
    unzip \
    nano \
    dbus-x11 \
    packagekit-gtk3-module \
    libcanberra-gtk3-module \
    openjdk-17-jdk \
    xclip \
    iproute2 \
    netcat-openbsd \
    curl \
    wget \
    fonts-roboto && \
    apt-get full-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y

# Create and switch to Burp directory
WORKDIR /root/burpsuite

# Download Burp Suite Community Edition JAR directly
RUN wget -q "https://portswigger.net/burp/releases/download?product=community&version=2024.1.1&type=Jar" -O burpsuite.jar 
# Install JetBrains Mono font
WORKDIR /root
RUN wget -q https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip && \
    mkdir -p /usr/share/fonts/ttf && \
    unzip -j JetBrainsMono-2.242.zip "fonts/ttf/*" -d /usr/share/fonts/ttf/ && \
    rm JetBrainsMono-2.242.zip

# Generate machine ID for D-Bus
RUN dbus-uuidgen > /etc/machine-id

# Add handy aliases and auto-start Burp in .bashrc
RUN echo "alias burp='java -jar -Xmx4g /root/burpsuite/burpsuite.jar'" >> /root/.bashrc && \
    echo "alias c='echo -e \033[0m'" >> /root/.bashrc && \
    echo "alias cls='clear'" >> /root/.bashrc && \
    echo "alias ee='exit'" >> /root/.bashrc && \
    echo "alias up='apt-get update && apt-get full-upgrade -y && apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y'" >> /root/.bashrc && \
    echo "burp &" >> /root/.bashrc

# Set working directory
WORKDIR /root
