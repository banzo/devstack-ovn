#!/bin/sh
# source: http://blog.russellbryant.net/2015/05/14/an-ez-bake-ovn-for-openstack/
DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update || sudo yum update -qy
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy git || sudo yum install -qy git
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy bridge-utils || sudo yum install -qy bridge-utils
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy ebtables || sudo yum install -qy ebtables
echo export LC_ALL=en_US.UTF-8 >> ~/.bash_profile
echo export LANG=en_US.UTF-8 >> ~/.bash_profile
git clone https://github.com/openstack-dev/devstack
git clone http://git.openstack.org/openstack/networking-ovn.git
cp networking-ovn/devstack/local.conf.sample devstack/local.conf
# devstack/stack.sh