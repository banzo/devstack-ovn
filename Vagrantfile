# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vagrant_config = YAML.load_file("config.yml")

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/vivid64"

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
  end

  config.vm.define "devstack-1" do |d1|
    d1.vm.network "private_network", ip: vagrant_config['devstack-1']['ip']
    d1.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false
  end

  config.vm.define "devstack-2" do |d2|
    d2.vm.network "private_network", ip: vagrant_config['devstack-2']['ip']
    d2.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false, :args => "SERVICE_HOST #{vagrant_config['devstack-1']['ip']}"
  end
end
