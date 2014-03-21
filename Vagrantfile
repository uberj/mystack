# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65x86"
  config.vm.hostname = "controller"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 * 3
    v.cpus = 2
  end

  # config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  config.vm.network :forwarded_port, guest: 80, host: 8081

  config.vm.network :private_network, ip: "10.0.0.2"  # Private Network
  config.vm.network :private_network, ip: "10.0.1.2"  # VM Network

  # Boot strap things
  config.vm.provision "shell", inline: "rpm -i http://repos.fedorapeople.org/repos/openstack/openstack-havana/rdo-release-havana-6.noarch.rpm || true"
  config.vm.provision "shell", inline: "yum -y install vim rubygems git iputils wget htop puppet"
  config.vm.provision "shell", inline: "gem install librarian-puppet-simple"
  config.vm.provision "shell", inline: "cd /etc/puppet/modules/openstack/ && librarian-puppet install --verbose --path ../"

  config.vm.synced_folder "./modules", "/etc/puppet/modules"
  config.vm.synced_folder "./modules/openstack", "/etc/puppet/modules/openstack"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "site.pp"
    puppet.facter = { 'fqdn' => config.vm.hostname }
  end
end
