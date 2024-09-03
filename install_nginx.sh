#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx

# Start and enable Nginx service
echo "Starting and enabling Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Check Nginx status
echo "Checking Nginx status..."
sudo systemctl status nginx

echo "Nginx has been installed and started successfully."
