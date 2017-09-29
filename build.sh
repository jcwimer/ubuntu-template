#!/bin/bash

#Static variables
COMPOSE_VERSION='1.14.0'
DOCKER_VERSION='17.06.0'
NFS_SERVER='10.0.0.150'

sudo mkdir /data
sudo mkdir /etc/network/interfaces.d

#Update
sudo apt-get update -qq
sudo apt-get dist-upgrade -y -qq

#Standard apps
sudo apt-get install -y \
	curl \
	openssh-server \
	vim \
	build-essential \
	linux-headers-server \
	git \
	tmux \
	zip \
	unzip \
	vim \
	fail2ban \
	htop \
	ntp \
	apache2-utils \
	mysql-client-core-5.5 \
	siege \
	dstat \
	htop \
	sysstat \
	nfs-common \
	dnsutils

sudo timedatectl set-timezone America/New_York

#Git settings
git config --global user.name "Jacob Cody Wimer"
git config --global user.email "jacob.wimer@gmail.com"

# Install docker key and repo
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# Install docker and compose
sudo apt-get update -qq
sudo apt-get install -y -qq docker-ce=${DOCKER_VERSION}~ce-0~ubuntu
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# Add cody to docker group
sudo usermod -a -G docker cody

#Heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#Copy update script
#sudo cp update.sh /etc/cron.daily/update.sh

#VIM Setup
cp configs/.vimrc ~/
#Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#Install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree



#Finished message
echo If this is a normal vm being used as a template, run non-vagrant-extras.sh, reboot, and run template-clean.sh.
echo If this is a vagrant machine you are ready to go.
