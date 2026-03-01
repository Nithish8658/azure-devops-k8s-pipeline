#!/bin/bash
# Install Java
sudo apt-get update
sudo apt-get install -y fontconfig openjdk-17-jre

# Remove old Jenkins sources if any
sudo rm -f /etc/apt/sources.list.d/jenkins.list

# Add new Jenkins GPG Key
sudo wget -q -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins Repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and Install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Enable and Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
