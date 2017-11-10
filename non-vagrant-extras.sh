#!/bin/bash

NFS_SERVER='10.0.0.150'

#Enable swap
if [[ -z $(swapon -s | grep -E "^/") ]] ; then
	fallocate -l 4G /swapfile
	sudo touch /swapfile
	sudo chown root:root /swapfile
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
	sudo sysctl vm.swappiness=10
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.conf
	sudo sysctl vm.vfs_cache_pressure=50
	echo 'vm.vfs_cache_pressure=50' | sudo tee /etc/sysctl.conf
fi

#Move config files
sudo cp configs/docker-daemon.json /etc/docker/daemon.json
sudo cp configs/sudoers /etc/sudoers
#sudo cp configs/fstab /etc/fstab
sudo bash -c "echo '10.0.0.150:/volumeUSB1/usbshare/raw-files/fileserver/shares/lab-data /data n    fs defaults 0 0' >> /etc/fstab"

#Setup networking with interfaces.d cfg files
sudo cp configs/interfaces /etc/network/interfaces
sudo cp configs/eth0.cfg /etc/network/interfaces.d/eth0.cfg
sudo chown root:root /etc/network/interfaces.d -R
sudo chmod -R 644 /etc/network/interfaces.d/

echo Done
