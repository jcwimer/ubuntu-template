
#Clean old kernals
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

#Clean for template
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
#sudo rm –rf /etc/ssh/*key*
sudo rm –rf ~/.ssh/authorized_keys
history -w
history -c
sudo poweroff
