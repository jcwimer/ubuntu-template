# ubuntu-template
Ubuntu and vagrant template


Vagrant build:

<tt>vagrant up</tt>

<tt>vagrant ssh</tt>

<tt>cd /vagrant</tt>

<tt>bash build.sh</tt>



Ubuntu virtual machine template build:

<tt>bash build.sh</tt>

<tt>sudo apt-get install open-vm-tools -y</tt>

<tt>sudo reboot</tt>

<tt>bash template-clean.sh</tt>

After template spins back up:

<tt>bash regen-ssh.sh</tt>