#!/bin/sh
# USAGE: setup-devstack.sh SERVICE_HOST=<IP_OF_THE_SERVICE_HOST> (if no service host provided, that Devstack will
# be considered a service host.
# SOURCE: http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/
DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy git
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy bridge-utils
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy ebtables
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy python-pip
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy python-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy build-essential
echo export LC_ALL=en_US.UTF-8 >> ~/.bash_profile
echo export LANG=en_US.UTF-8 >> ~/.bash_profile
git clone https://github.com/openstack-dev/devstack
git clone http://git.openstack.org/openstack/networking-ovn.git
cp networking-ovn/devstack/local.conf.sample devstack/local.conf
if [ "$1" != "" ]; then
    echo $1 >> devstack/local.conf
fi
echo "MULTI_HOST=1" >> devstack/local.conf
sudo pip install tox
devstack/stack.sh