node controller {
  class { 'openstack::all':
    public_address       => '10.0.0.2',
    public_interface     => 'eth0',
    private_interface    => 'eth1',
    admin_email          => 'uberj@localhost',
    admin_password       => '7d97e98f8af710c7e7fe703abc8f639e0ee507c4',
    keystone_admin_token => 'e5fa44f2b31c1fb553b6021e7360d07d5d91ff5e',
    keystone_db_password => '7448d8798a4380162d4b56f9b452e2f6f9e24e7a',
    cinder_db_password   => 'a3db5c13ff90a36963278c6a39e4ee3c22e2a436',
    cinder_user_password => '9c6b057a2b9d96a4067a749ee3b3b0158d390cf1',
    nova_user_password   => '5d9474c0309b7ca09a182d888f73b37a8fe1362c',
    nova_db_password     => 'ccf271b7830882da1791852baeca1737fcbe4b90',
    glance_user_password => '7d97e98f8af710c7e7fe703abc8f639e0ee507c4',
    glance_db_password   => 'ad552e6dc057d1d825bf49df79d6b98eba846ebe',
    rabbit_password      => 'ad48103e4fc71796e9708cafc43adeed0d1076b7',
    rabbit_user          => 'rabbit',
    libvirt_type         => 'qemu',
    fixed_range          => '10.0.1.0/24',
    secret_key           => 'ba9f376fa71904ccde2a756a24a4e47ec014ee0a',
    neutron              => false,
    mysql_root_password  => 'd0758565fd06c37aa66b071160d156f5628cd518',
  }
}
