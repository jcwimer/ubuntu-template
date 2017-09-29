#!/bin/bash

#Clean for template
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
#sudo rm –rf /etc/ssh/*key*
sudo rm –rf ~/.ssh/authorized_keys
history -w
history -c
sudo shutdown -h now
