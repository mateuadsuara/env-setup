# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provision "shell", inline: <<-SHELL
add-apt-repository ppa:tmate.io/archive -y
apt-get update

apt-get install -y language-pack-en
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
echo "LANG=en_US.UTF-8" >> /etc/default/locale

apt-get install -y tmate
ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''

apt-get install -y git
git config --global core.editor "vim"

apt-get install -y ruby-full

cd /home/vagrant
git clone https://github.com/mateuadsuara/env-setup.git /home/vagrant/env-setup
cd /home/vagrant/env-setup
ruby setup.rb /home/vagrant

chown -R vagrant:vagrant /home/vagrant
  SHELL
end
