#!/bin/sh
# USAGE: setup-devstack.sh SERVICE_HOST=<IP_OF_THE_SERVICE_HOST> (if no service host provided, that Devstack will
# be considered a service host.
# SOURCE: http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/
DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update || sudo yum update -qy
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy git || sudo yum install -qy git
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy bridge-utils || sudo yum install -qy bridge-utils
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy ebtables || sudo yum install -qy ebtables
echo export LC_ALL=en_US.UTF-8 >> ~/.bash_profile
echo export LANG=en_US.UTF-8 >> ~/.bash_profile
git clone https://github.com/openstack-dev/devstack
git clone http://git.openstack.org/openstack/networking-ovn.git
cp networking-ovn/devstack/local.conf.sample devstack/local.conf
if [ "$1" != "" ]; then
    echo $1 >> devstack/local.conf
fi
devstack/stack.sh