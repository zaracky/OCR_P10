#!/bin/bash

#installation docker compose +aws cli

sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose
sudo apt-get install -y python unzip
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo rm awscliv2.zip
sudo rm -fr aws/




#environnement docker (1)
mkdir docker-compose
cd docker-compose
mkdir docker
mkdir docker/sources
sudo wget https://esparonloic.s3.eu-west-3.amazonaws.com/docker-compose.yml

#Creation du fichier env
aws secretsmanager get-secret-value --secret-id DB_USER | grep -i "SecretString" > credentials.env
sed -i 's/\"SecretString": "/\d10/' credentials.env
sed -i 's/\\n/\d10/' credentials.env
sed -i 's/\\n/\d10/' credentials.env
sed -i 's/\\n/\d10/' credentials.env
sed -i 's/\\n/\d10/' credentials.env
sed -i 's/\",/\d10/' credentials.env

#environnement docker (2)
#sudo wget https://esparonloic.s3.eu-west-3.amazonaws.com/credentials.env
cd docker 
sudo wget https://esparonloic.s3.eu-west-3.amazonaws.com/Dockerfile
cd sources
sudo wget  https://esparonloic.s3.eu-west-3.amazonaws.com/amazon-s3-and-cloudfront.tar.xz
sudo tar xvf amazon-s3-and-cloudfront.tar.xz 
sudo rm amazon-s3-and-cloudfront.tar.xz 
sudo docker-compose up -d 

#alias
cd ~
sudo echo "alias update='sudo apt-get update'" >> .bashrc
sudo echo "alias upgrade='sudo apt-get upgrade'" >> .bashrc
sudo echo "alias dc='sudo docker-compose'" >> .bashrc
sudo echo "alias install='sudo apt-get install'" >> .bashrc
