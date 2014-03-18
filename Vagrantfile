# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  config.vm.hostname = "controller"

  # config.vm.box_url = "http://domain.com/path/to/above.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.network :public_network, :bridge => 'wlp3s0'
  config.vm.network :private_network, ip: "10.10.10.2"  # VM Network

  # Boot strap things
  #config.vm.provision "shell", inline: "yum -y install vim rubygems git iputils"
  #config.vm.provision "shell", inline: "gem install librarian-puppet-simple"
  #config.vm.provision "shell", inline: "cd /etc/puppet/modules/openstack/ && librarian-puppet install --verbose --path ../"

  config.vm.synced_folder "./modules", "/etc/puppet/modules/"
  config.vm.synced_folder "./modules/openstack", "/etc/puppet/modules/openstack"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.module_path = "modules"
     puppet.manifest_file  = "site.pp"
     puppet.facter = { 'fqdn' => config.vm.hostname }
   end
end
