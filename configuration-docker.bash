#!/bin/bash


#alias
sudo echo "alias update='sudo apt-get update'" >> .bashrc
sudo echo "alias upgrade='sudo apt-get upgrade'" >> .bashrc
sudo echo "alias dc='sudo docker-compose'" >> .bashrc
sudo echo "alias install='sudo apt-get install'" >> .bashrc

source .bashrc

#installation docker+compose

sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose

#environnement docker
mkdir docker-compose
cd docker-compose
mkdir volume
sudo wget https://esparonloic.s3.eu-west-3.amazonaws.com/docker-compose.yml 
