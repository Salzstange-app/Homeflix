#!/bin/bash


echo "Docker Installer"

#sudo apt-get install ca certificates curl
#sudo install -m 0755 -d /etc/apt/keyrings
#sudo curl -fsSl https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
#sudo chmod a+r /etc/apt/keyrings/docker.asc


#echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#  sudo apt-get update -y

#    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
#$(...) is used to capture the output of the command and store it in the testvar variable.
dockerVersion=$(sudo docker --version)



echo "Docker is installed: $dockerVersion"