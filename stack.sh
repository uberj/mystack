#!/bin/bash

export OPENRC=/home/vagrant/openrc
export ADMIN_PASS=7d97e98f8af710c7e7fe703abc8f639e0ee507c4  # should probably setup heira
echo "
export OS_USERNAME=admin
export OS_PASSWORD=$ADMIN_PASS
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://controller:35357/v2.0" > $OPENRC

source $OPENRC
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
nova keypair-add --pub_key ~/.ssh/id_rsa.pub mykey
nova keypair-list

nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0

export IMG=cirros_0.3.0.img
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img -O $IMG
glance image-create --name=cirros --disk-format=qcow2 --container-format=bare --is-public=true < $IMG

sudo ip route del 10.0.1.0/24 dev eth2
