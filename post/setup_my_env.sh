#!/bin/bash

if (($# < 2)); then
  echo "Parameters: [hostname] [ip-address or dhcp]"
  exit 5
fi


sudo sed -i s/ubuntu/$1/g /etc/hostname
sudo sed -i s/ubuntu/$1/g /etc/hosts

if [ $2 == "dhcp" ]; then
  sudo cp dhcp.cfg /etc/network/interfaces.d/eth0.cfg
else
  sudo cp static.cfg /etc/network/interfaces.d/eth0.cfg
  sudo sed -i s/0.0.0.0/$2/g /etc/network/interfaces.d/eth0.cfg
fi

sudo chown root:root /etc/network/interfaces.d -R
sudo chmod -R 644 /etc/network/interfaces.d/

sudo bash regen-ssh.sh

bash authorized-keys.sh

sudo reboot
