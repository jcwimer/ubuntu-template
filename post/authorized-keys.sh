cat id_rsa.pub >> authorized_keys

sudo mkdir /root/.ssh
mkdir ~/.ssh

sudo cp authorized_keys /root/.ssh/
cp authorized_keys ~/.ssh/

sudo chown root:root /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys

chown $USER:$USER ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

rm authorized_keys
