#!/bin/bash

if (($# < 1)); then
  echo "Parameters: [hostname] [ip-address or dhcp]"
  exit 5
fi


sudo sed -i s/ubuntu/$1/g /etc/hostname
sudo sed -i s/ubuntu/$1/g /etc/hosts

if [ $2 == "dhcp" ]; then
  sudo cp dhcp.config /etc/network/interfaces
else
  sudo cp static.config /etc/network/interfaces
  sudo sed -i s/0.0.0.0/$2/g /etc/network/interfaces
fi

sudo chown root:root /etc/network/interfaces
sudo chmod 644 /etc/network/interfaces

sudo bash regen-ssh.sh

bash authorized-keys.sh

sudo reboot
