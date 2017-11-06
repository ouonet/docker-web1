#!/usr/bin/env bash  
sudo apt-get remove docker docker-engine docker.io  
 sudo apt-get update  
sudo apt-get install \  
    apt-transport-https \  
    ca-certificates \  
    curl \  
    software-properties-common  
  
#Add Docker’s official GPG key:  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  
  
#set up the stable repository.  
sudo add-apt-repository \  
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \  
   $(lsb_release -cs) \  
   stable"  
  
#docker  
sudo apt-get update  
sudo apt-get install docker-ce 
