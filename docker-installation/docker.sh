## SCRIPT USED TO INSTALL DOCKER IN AWS EC2 Ubuntu Instance.


#!/bin/bash
#Ubuntu Server 18.04  LTS (HVM)
#Ubunto EC2-instances creates an ubuntu user by default 
sudo hostname docker 
sudo apt update -y
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu #adding the ubuntu user to the docker group
sudo su - ubuntu     
#Docker commands needs admin rights or sudo privileges to run Docker commands
