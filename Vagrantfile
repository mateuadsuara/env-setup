# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  provision_ssh_keys(config, {
    "id_rsa" => "id_rsa",
    "id_rsa.pub" => "id_rsa.pub"
  })

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y language-pack-en
    echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
    echo "LANG=en_US.UTF-8" >> /etc/default/locale
  SHELL
  config.vm.provision "shell", path: "vagrant-setup.sh"
  config.vm.provision "shell", inline: <<-SHELL
    chown -R vagrant:vagrant /home/vagrant
  SHELL
end

def provision_ssh_keys(config, keys)
  keys.each do |source, destination|
    config.vm.provision "file", source: "#{Dir.home}/.ssh/#{source}", destination: "/home/vagrant/.ssh/#{destination}"
  end
end

def authorize_public_key(public_key_file)
  public_key = File.readlines("#{Dir.home}/.ssh/#{public_key_file}").first.strip
  config.vm.provision "shell", inline: <<-SHELL
    echo #{public_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{public_key} >> /root/.ssh/authorized_keys
  SHELL
end
