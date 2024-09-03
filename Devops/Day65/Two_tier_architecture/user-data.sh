#!/bin/bash
# Use this for your user data (script from top to bottom)
# install apache2 (Ubuntu version)
apt-get update -y
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
apt-get install -y mariadb-server
apt-get update -y
systemctl start mariadb
systemctl enable mariadb