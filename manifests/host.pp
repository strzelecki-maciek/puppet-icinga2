class icinga2::host (
  $address = $::ipaddress,
  $address6 = $::ipaddress6,
  $host_template => hiera('icinga2::host_type', 'generic-host'),
){

  include icinga2::nrpe
  $ensure = present

  @@icinga2::object::host{ $::fqdn:
    address      => $address,
    address6     => $address6,
    ca_env       => $::ca_env,
    ca_hostgroup => $::hostgroup,
    $import      => $host_template
  }
  $defaults = { host_name => $::fqdn }
}
