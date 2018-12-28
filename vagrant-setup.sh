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

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install 'lts/*'
npm install -g elm
npm install -g elm-test
npm install -g elm-oracle
npm install -g elm-format
