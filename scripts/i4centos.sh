#!/usr/bin/env bash
sudo yum remove docker \
                  docker-common \
                  docker-selinux \
                  docker-engine
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
                        
yum install -y docker-ce

systemctl enable docker

cat >/etc/docker/daemon.json << EOF
{
	"registry-mirrors": ["https://rmw18jx4.mirror.aliyuncs.com"]
}
EOF
sudo systemctl start docker

i#install docker-compose
#can't download from github cause of blocking by firewall
#curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#use pip to install 
yum -y install python-pip
pip install --upgrade pip
pip install docker-compose
