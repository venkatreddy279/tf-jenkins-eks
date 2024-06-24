#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package index
echo "Updating package index..."
sudo apt-get update -y

# Install Java (Jenkins requires Java to run)
echo "Installing Java..."
sudo apt-get install -y openjdk-11-jdk

# Add Jenkins repository and GPG key
echo "Adding Jenkins repository and GPG key..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package index again after adding the Jenkins repository
echo "Updating package index again..."
sudo apt-get update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install -y jenkins

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
echo "Enabling Jenkins service to start on boot..."
sudo systemctl enable jenkins

# Print the status of Jenkins service
echo "Jenkins service status:"
sudo systemctl status jenkins

# Print the initial admin password for Jenkins
echo "Jenkins installation completed. Initial Admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "You can access Jenkins at http://your_server_ip_or_domain:8080"