#!/bin/bash
# Author: KENFCAK AZAPMO
# date: 08/04/2026
# Update system
sudo apt update -y
# Install Java 17 (required for Jenkins)
sudo apt install openjdk-17-jdk -y
# Verify Java
java -version
# Install required tools
sudo apt install wget curl -y
# Download Jenkins .deb package (stable version)
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.541.2_all.deb
# Install Jenkins
sudo apt install ./jenkins_2.541.2_all.deb -y
# Give sudo access to Jenkins user
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins
# Set password jenkins user password 
echo "jenkins:admin" | sudo chpasswd
# Enable SSH password authentication
sudo sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh
# Start Jenkins
sudo systemctl start jenkins
# Enable Jenkins on boot
sudo systemctl enable jenkins
# Check status
sudo systemctl status jenkins
# OPTIONAL: Add Jenkins to docker group (only if Docker is installed)
sudo usermod -aG docker jenkins

#i used this script to install jenkins ubuntu server with Docker installed
# in the same sever. this is the reason why i ryn the las command to add 
#jenkins user to the docker group 