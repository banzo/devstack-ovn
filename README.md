Devstack OVN
=======

Setup 2 Devstack virtual machines using OVN

This automates the setup described here: http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/

Quick Start
------

Install Virtualbox (https://www.virtualbox.org/wiki/Downloads) and Vagrant (http://downloads.vagrantup.com).

```
$ git clone https://github.com/banzo/devstack-ovn
$ cd devstack-ovn
$ vagrant up
$ ... (this may take a while)
vagrant ssh devstack-1
```

Next steps
------

* use another provisioner than bash scripts, maybe merge back into the existing vagrant-devstack projects (see References), but they were not working properly when I tried.

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