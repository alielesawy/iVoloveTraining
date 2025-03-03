#!/bin/bash
# Update package list and upgrade installed packages
sudo apt update -y && sudo apt upgrade -y

# Install Apache
sudo apt install apache2 -y

# Enable Apache to start on boot
sudo systemctl enable apache2

# Start Apache service
sudo systemctl start apache2

# Allow HTTP traffic through UFW firewall
sudo ufw allow 'Apache'

# Create a simple test page
echo "<h1>Apache is running on Ubuntu EC2</h1>" | sudo tee /var/www/html/index.html

# Ensure permissions are correct
sudo chown -R www-data:www-data /var/www/html

# Restart Apache to apply changes
sudo systemctl restart apache2
