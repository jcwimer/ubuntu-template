echo "source /etc/network/interfaces.d/*" >> /etc/network/interfaces

cat > /etc/network/interfaces.d/eth01 <<EOF
auto eth0:1
iface eth0:1 inet static
address ${1}
netmask 255.255.255.0
gateway 10.0.0.1
dns-nameservers 10.0.0.1
EOF

ifup eth0:1
