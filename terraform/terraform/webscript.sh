
#! /bin/bash
#
#
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# create html file
#
#
echo "<html><h1>we are learnign terraform</h1></html>" | sudo tee /var/www/html/index.html

