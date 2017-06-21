# Install httpd
sudo yum -y install httpd

#Change httpd default port
OLD_PORT = 80
NEW_PORT = 8010
sudo sed -i 's/$OLD_PORT/$NEW_PORT/g' /etc/httpd/ports.conf

# Start httpd
sudo service httpd start

# Add firewall rules
iptables -A INPUT -p tcp --sport 8010 -j ACCEPT
sudo /sbin/iptables-save
