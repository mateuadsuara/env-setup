add-apt-repository ppa:tmate.io/archive -y
apt-get update

apt-get install -y tmate
ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''

apt-get install -y git
git config --global core.editor "vim"

apt-get install -y ruby-full

cd /home/vagrant
git clone https://github.com/mateuadsuara/env-setup.git /home/vagrant/env-setup
cd /home/vagrant/env-setup
ruby setup.rb /home/vagrant

apt-get -y install python3-pip
pip3 install termtosvg

chown -R vagrant:vagrant /home/vagrant
