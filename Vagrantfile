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

  config.vm.define "devstack_controller" do |d1|
    d1.vm.host_name = vagrant_config['devstack_controller']['host_name']
    d1.vm.network "private_network", ip: vagrant_config['devstack_controller']['ip']
    d1.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    d1.vm.provision "shell", path: "provision/setup-controller.sh", privileged: false

    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_controller']['memory']
       vb.cpus = vagrant_config['devstack_controller']['cpus']
    end
  end

  config.vm.define "devstack_compute" do |d1c|
    d1c.vm.host_name = vagrant_config['devstack_compute']['host_name']
    d1c.vm.network "private_network", ip: vagrant_config['devstack_compute']['ip']
    d1c.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    d1c.vm.provision "shell", path: "provision/setup-compute.sh", privileged: false, :args => "#{vagrant_config['devstack_controller']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_compute']['memory']
       vb.cpus = vagrant_config['devstack_compute']['cpus']
    end
  end
end
