#!/bin/bash

sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update -qq
sudo apt-get install -y -qq \
	sublime-text-installer \
	xrdp
wget https://download.jetbrains.com/idea/ideaIC-15.0.2.tar.gz
tar -zxvf ideaIC-15.0.2.tar.gz
rm ideaIC-15.0.2.tar.gz
sudo mv idea-IC-143.1184.17 /opt/idea
sudo cp idea.desktop /usr/share/applications
sudo cp /opt/idea/bin/idea.png /usr/share/pixmaps/idea.png
cd /usr/local/bin
sudo ln -s /opt/idea/bin/idea.sh

