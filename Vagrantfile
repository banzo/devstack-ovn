# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

virtualbox_config = YAML.load_file("config/virtualbox.config.yml")
openstack_config = YAML.load_file("config/openstack.config.yml")

Vagrant.configure(2) do |config|
  config.vm.box = virtualbox_config['box']

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  # CONTROLLER NODE

  config.vm.define "devstack" do |d1|
    d1.vm.host_name = virtualbox_config['devstack']['host_name']
    d1.vm.network "private_network", ip: virtualbox_config['devstack-1']['ip']
    d1.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    d1.vm.provision "shell", path: "provision/setup-controller.sh", privileged: false

    config.vm.provider "virtualbox" do |vb|
       conf = YAML.load_file("config/virtualbox.config.yml")
       vb.memory = virtualbox_config['devstack']['memory']
       vb.cpus = virtualbox_config['devstack']['cpus']
    end
    config.vm.provider :openstack do |os, override|
        os.username     = openstack_config["username"]
        os.api_key      = openstack_config["api_key"]
        os.flavor       = openstack_config["flavor"]
        os.image        = openstack_config["image"]
        os.endpoint     = openstack_config["endpoint"]
        os.keypair_name = openstack_config["keypair_name"]
        os.ssh_username = openstack_config["ssh_username"]
        os.tenant       = openstack_config["tenant"]
        os.networks     = openstack_config["network"]
        os.networks     = [openstack_config["network"]]
        os.floating_ip  = openstack_config["floating_ip"]
        os.floating_ip_pool = openstack_config["floating_ip_pool"]
        override.vm.box = openstack_config["box"]
        override.vm.box = openstack_config["box_url"]
        override.ssh.private_key_path = openstack_config["ssh_private_key_path"]
    end
  end

  # COMPUTE NODE

  config.vm.define "devstack-compute" do |d1c|
    d1c.vm.host_name = virtualbox_config['devstack-compute']['host_name']
    d1c.vm.network "private_network", ip: virtualbox_config['devstack-compute']['ip']
    d1c.vm.provision "shell", path: "provision/setup-base.sh", privileged: false
    d1c.vm.provision "shell", path: "provision/setup-compute.sh", privileged: false, :args => "#{virtualbox_config['devstack']['ip']}"
    config.vm.provider "virtualbox" do |vb|
       vb.memory = virtualbox_config['devstack-compute']['memory']
       vb.cpus = virtualbox_config['devstack-compute']['cpus']
    end
    config.vm.provider :openstack do |os, override|
        os.username     = openstack_config["username"]
        os.api_key      = openstack_config["api_key"]
        os.flavor       = openstack_config["flavor"]
        os.image        = openstack_config["image"]
        os.endpoint     = openstack_config["endpoint"]
        os.keypair_name = openstack_config["keypair_name"]
        os.ssh_username = openstack_config["ssh_username"]
        os.tenant       = openstack_config["tenant"]
        os.networks     = openstack_config["network"]
        os.networks     = [openstack_config["network"]]
        os.floating_ip  = openstack_config["floating_ip"]
        os.floating_ip_pool = openstack_config["floating_ip_pool"]
        override.vm.box = openstack_config["box"]
        override.vm.box = openstack_config["box_url"]
        override.ssh.private_key_path = openstack_config["ssh_private_key_path"]
    end
  end
end
