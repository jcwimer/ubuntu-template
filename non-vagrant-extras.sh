#!/bin/bash

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

#Mounts
if [[ -z $(sudo cat /etc/fstab | grep "${NFS_SERVER}:/volumeUSB1/usbshare/raw-files/fileserver/shares/lab-data") ]]; then
	echo "${NFS_SERVER}:/volumeUSB1/usbshare/raw-files/fileserver/shares/lab-data /data nfs defaults 0 0" | sudo tee /etc/fstab
fi

#Move config files
sudo cp docker-daemon.json /etc/docker/daemon.json
sudo cp sudoers /etc/sudoers

echo Done