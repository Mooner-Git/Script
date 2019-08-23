#!/bin/bash


apt-get update
apt-get install openjdk-8-jdk -y

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update
apt-get install jenkins -y
systemctl status jenkins
sudo ufw allow 8080
