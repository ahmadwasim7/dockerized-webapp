#!/bin/bash
set -euxo pipefail

# Update system
yum update -y

# Install Docker
sudo yum install docker -y

# Start & enable Docker
systemctl start docker
systemctl enable docker

# Allow ec2-user to run docker (optional but useful)
usermod -aG docker ec2-user

# Verify installation (for logs)
docker --version
