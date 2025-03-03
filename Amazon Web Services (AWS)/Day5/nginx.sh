#!/bin/bash
# Update package list and upgrade installed packages
sudo apt update -y && sudo apt upgrade -y

# Install Nginx
sudo apt install nginx -y

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Start Nginx service
sudo systemctl start nginx

# Allow HTTP traffic through UFW firewall
sudo ufw allow 'Nginx HTTP'

# Create a simple test page
echo "<h1>Nginx is running on Ubuntu EC2</h1>" | sudo tee /var/www/html/index.html

# Ensure permissions are correct
sudo chown -R www-data:www-data /var/www/html

# Restart Nginx to apply changes
sudo systemctl restart nginx
