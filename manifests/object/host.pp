define icinga2::object::host (
  $host_name     = $title,
  $address       = false,
  $address6      = false,
  $import        = $ca_host_type,
  #$import       = 'generic-host',
  $os            = $::kernel,
  $ca_env        = $::ca_env,
  $ca_hostgroup  = $::ca_hostgroup,
  $sla           = '24x7',
  ) {

  file { "/etc/icinga2/conf.d/puppet/hosts/${name}.conf":
    ensure  => 'present',
    mode:   => '0644',
    content => template('icinga2/host.conf.erb'),
  }
}

