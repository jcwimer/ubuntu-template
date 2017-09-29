#!/bin/bash

if (($# < 1)); then
  echo "Parameters: [ip-address]"
  exit 5
fi

sudo cp static.cfg /etc/network/interfaces.d/eth01.cfg
sudo sed -i s/0.0.0.0/$1/g /etc/network/interfaces.d/eth01.cfg
sudo sed -i s/eth0/eth0\:1/g /etc/network/interfaces.d/eth01.cfg

sudo chown root:root /etc/network/interfaces.d -R
sudo chmod -R 644 /etc/network/interfaces.d/


ifup eth0:1
