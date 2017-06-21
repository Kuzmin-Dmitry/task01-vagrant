# Install wget (AWS RHEL based VMs haven't it)
sudo yum install wget

# Add Jenkins repository to the yum repos, and install Jenkins from here
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins

# Jenkins requires Java
sudo yum install default-jdk

# Start Jenkins daemon
sudo service jenkins start

# Add firewall rules
iptables -A INPUT -p tcp --sport 80 -j ACCEPT
iptables -A INPUT -p tcp --sport 8080 -j ACCEPT
sudo /sbin/iptables-save

