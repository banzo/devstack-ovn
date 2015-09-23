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

  # DEVSTACK CONTROLLER 1
  config.vm.define "devstack_controller" do |devstack_controller|
    devstack_controller.vm.host_name = vagrant_config['devstack_controller']['host_name']
    devstack_controller.vm.network "private_network", ip: vagrant_config['devstack_controller']['ip']
    devstack_controller.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    devstack_controller.vm.provision "shell", path: "provision/setup-controller.sh", privileged: false

    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_controller']['memory']
       vb.cpus = vagrant_config['devstack_controller']['cpus']
    end
  end

  # DEVSTACK COMPUTE 1
  config.vm.define "devstack_compute" do |devstack_compute|
    devstack_compute.vm.host_name = vagrant_config['devstack_compute']['host_name']
    devstack_compute.vm.network "private_network", ip: vagrant_config['devstack_compute']['ip']
    devstack_compute.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    devstack_compute.vm.provision "shell", path: "provision/setup-compute.sh", privileged: false, :args => "#{vagrant_config['devstack_controller']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_compute']['memory']
       vb.cpus = vagrant_config['devstack_compute']['cpus']
    end
  end

  # DEVSTACK CONTROLLER 2
  config.vm.define "devstack_controller2" do |devstack_controller2|
    devstack_controller2.vm.host_name = vagrant_config['devstack_controller2']['host_name']
    devstack_controller2.vm.network "private_network", ip: vagrant_config['devstack_controller2']['ip']
    devstack_controller2.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    devstack_controller2.vm.provision "shell", path: "provision/setup-controller.sh", privileged: false

    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_controller2']['memory']
       vb.cpus = vagrant_config['devstack_controller2']['cpus']
    end
  end

  # DEVSTACK COMPUTE 2
  config.vm.define "devstack_compute2" do |devstack_compute2|
    devstack_compute2.vm.host_name = vagrant_config['devstack_compute2']['host_name']
    devstack_compute2.vm.network "private_network", ip: vagrant_config['devstack_compute2']['ip']
    devstack_compute2.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    devstack_compute2.vm.provision "shell", path: "provision/setup-compute.sh", privileged: false, :args => "#{vagrant_config['devstack_controller2']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = vagrant_config['devstack_compute2']['memory']
       vb.cpus = vagrant_config['devstack_compute2']['cpus']
    end
  end

end
