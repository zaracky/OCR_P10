#!/bin/bash

#installation docker compose +aws cli

sudo apt-get update && sudo apt-get install -y strongswan
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo rm awscliv2.zip
sudo rm -fr aws/

#Recuperation du secret
aws secretsmanager get-secret-value --secret-id VPN | grep -i "SecretString" > ipsec.secret
sed -i 's/\"SecretString": "/\d10/' ipsec.secret
sed -i 's/\\/\ /' ipsec.secret
sed -i 's/\\/\ /' ipsec.secret
sed -i 's/\",/\d10/' ipsec.secret
sudo rm /etc/ipsec.secret
sudo cp ipsec.secret /etc/ipsec.secret
sudo rm ipsec.secret

cd /etc/
sudo rm ipsec.conf
sudo wget https://esparonloic.s3.eu-west-3.amazonaws.com/ipsec.conf
