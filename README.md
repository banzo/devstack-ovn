Devstack OVN
=======

Launch 2 Ubuntu VM's on VirtualBox: the main one contains a full devstack and the other adds a compute node to it.
OVN is used as the Open vSwitch backend.

This automates the setup described here: http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/

Quick Start
------

1. Install Virtualbox (https://www.virtualbox.org/wiki/Downloads) and Vagrant (http://downloads.vagrantup.com).

2. Configure

```
git clone https://github.com/banzo/devstack-ovn
cd devstack-ovn
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-vbguest
```

3. Adjust the settings in `config.yml`

4. Launch the VM's: `vagrant up`

... This may take a while, once it is finished you can 

* ssh into the virtual machines e.g. `vagrant ssh devstack_controller`
* access the horizon dashboard at http://devstack.controller.dev

Next steps
------

* use another provisionner than bash scripts
* maybe merge back into the existing vagrant-devstack projects (see References), but they were not working properly when I tried (maybe related to https://ask.openstack.org/en/question/59404/stacksh-hangs-on-git-clone-to-optstacknova/).
* add provisioning scripts for CentOS/Fedora

References
------

### OVN

* http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/
* http://blog.russellbryant.net/2015/04/21/ovn-and-openstack-status-2015-04-21/
* http://galsagie.github.io/sdn/openstack/ovs/2015/04/20/ovn-1/

### Devstack

* https://github.com/openstack-dev/devstack-vagrant
* https://github.com/bcwaldon/vagrant_devstack
* http://docs.openstack.org/developer/devstack/guides/single-vm.html
* http://docs.openstack.org/developer/networking-ovn/testing.html