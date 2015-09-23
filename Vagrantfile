# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vagrant_config = YAML.load_file("config.yml")

Vagrant.configure(2) do |config|
  config.vm.box = vagrant_config['box']

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  config.vm.define "devstack-1" do |d1|
    #d1.vm.host_name = vagrant_config['devstack-1']['host_name']
    d1.vm.network "private_network", ip: vagrant_config['devstack-1']['ip']
    d1.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack-1']['memory']
       vb.cpus = vagrant_config['devstack-1']['cpus']
    end
  end

  config.vm.define "devstack-1-compute" do |d1c|
    d1c.vm.host_name = vagrant_config['devstack-1-compute']['host_name']
    d1c.vm.network "private_network", ip: vagrant_config['devstack-1-compute']['ip']
    d1c.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false, :args => "SERVICE_HOST=#{vagrant_config['devstack-1']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack-1-compute']['memory']
       vb.cpus = vagrant_config['devstack-1-compute']['cpus']
    end
  end
end
