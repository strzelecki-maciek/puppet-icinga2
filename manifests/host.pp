class icinga2::host (
  $address = $::ipaddress,
  $address6 = $::ipaddress6,
){

  include icinga2::nrpe
  $ensure = present

  @@icinga2::object::host{ $::fqdn:
    address      => $address,
    address6     => $address6,
    ca_env       => $::ca_env,
    ca_hostgroup => $::hostgroup,
    ca_host_type => hiera('icinga2::host_type', 'generic-host'),
  }
  $defaults = { host_name => $::fqdn }
}
