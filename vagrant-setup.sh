add-apt-repository ppa:tmate.io/archive -y
apt-get update
apt-get install -y tmate
if [ ! -f  /home/vagrant/.ssh/id_rsa ]; then
  ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''
fi

apt-get install -y git
su vagrant <<'GIT'
git config --global core.editor "vim"
git config --global user.email "mateuadsuara@gmail.com"
git config --global user.name "Mateu Adsuara"
GIT

apt-get install -y postgresql postgresql-contrib libpq-dev #for pg gem

apt-get install -y ruby-full
apt-get install -y build-essential #for http gem
apt-get install -y zlib1g-dev #for nokogiri gem
gem install bundler

apt-get install -y openjdk-8-jdk
apt-get install -y maven

apt-get -y install python3-pip
pip3 install termtosvg

su vagrant <<'ELM'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 'lts/*'
npm install -g elm
npm install -g elm-test
npm install -g elm-oracle
npm install -g elm-format
ELM

su vagrant <<'ELIXIR'
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
sudo dpkg -i erlang-solutions_1.0_all.deb && \
sudo apt-get update && \
sudo apt-get install esl-erlang -y && \
sudo apt-get install elixir -y
ELIXIR

git clone https://github.com/mateuadsuara/env-setup.git /home/vagrant/env-setup
cd /home/vagrant/env-setup
ruby setup.rb /home/vagrant
