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
    d1.vm.host_name = vagrant_config['devstack-1']['host_name']
    d1.vm.network "private_network", ip: vagrant_config['devstack-1']['ip']
    d1.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack-1']['memory']
       vb.cpus = vagrant_config['devstack-1']['cpus']
    end
  end

  config.vm.define "devstack-2" do |d2|
    d2.vm.host_name = vagrant_config['devstack-2']['host_name']
    d2.vm.network "private_network", ip: vagrant_config['devstack-2']['ip']
    d2.vm.provision "shell", path: "provision/setup-devstack.sh", privileged: false, :args => "SERVICE_HOST=#{vagrant_config['devstack-1']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack-2']['memory']
       vb.cpus = vagrant_config['devstack-2']['cpus']
    end
  end
end
