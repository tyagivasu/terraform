#!/bin/bash
sudo apt-get update -y
sudo apt install openjdk-8-jdk -y
java -version
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' -y
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y
