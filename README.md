# ubuntu-template
Ubuntu and vagrant template


Vagrant build:

<tt>vagrant up</tt>

<tt>vagrant ssh</tt>

<tt>cd /vagrant</tt>

<tt>bash build.sh</tt>



Ubuntu virtual machine template build:

<tt>bash build.sh</tt> (without root)

<tt>bash non-vagrant-extras.sh</tt> (without root)

<tt>sudo reboot</tt>

<tt>bash template-clean.sh</tt>


Home env:

Need to make sure your current directory is ubuntu-template/post

<tt>cd ubuntu-template/post</tt>

Run without root

<tt>bash setup_my_env.sh hostname ipaddress.or.dhcp</tt>

AFTER TEMPLATE INSTALL

*Import gpg key
