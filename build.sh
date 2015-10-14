#Update
sudo apt-get update
sudo apt-get upgrade -y

#Standard apps
sudo apt-get install -y curl openssh-server vim build-essential linux-headers-server git tmux zip unzip vim fail2ban

#Git settings
git config --global user.name "Jacob Cody Wimer"
git config --global user.email "jacob.wimer@gmail.com"

#Docker install
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $USER
curl -L https://github.com/docker/compose/releases/download/1.4.1/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose

#Heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#Copy update script
sudo cp update.sh /etc/cron.daily/update.sh

#Vim
cp vim.zip ~
cd ~
unzip vim.zip
rm vim.zip

#Finished message
echo If this is a normal vm being used as a template, run: sudo apt-get install open-vm-tools -y, reboot, and run template-clean.sh.
echo If this is a vagrant machine you are ready to go.
