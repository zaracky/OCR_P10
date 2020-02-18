#!/bin/bash

#hostname

sudo hostname ubuntu
sudo chmod o+w /etc/hostname
sudo echo "ubuntu" > /etc/hostname
sudo chmod o-w /etc/hostname


#alias
sudo echo "alias update='sudo apt-get update'" >> .bashrc
sudo echo "alias upgrade='sudo apt-get upgrade'" >> .bashrc
sudo echo "alias dc='sudo docker-compose'" >> .bashrc
sudo echo "alias install='sudo apt-get install'" >> .bashrc

source .bashrc

#Installation basique
sudo apt-get install net-tools
sudo apt-get install ssh

#Modification droit
sudo chmod o+w /etc/sudoers
sudo echo "loic ALL=NOPASSWD: ALL" >> /etc/sudoers
sudo chmod o-w /etc/sudoers
