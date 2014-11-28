class icinga2::nrpe (
  $nrpe_user = hiera('icinga2::nrpe::user', 'nagios'),
  $allowed_hosts = hiera('icinga2::nrpe::allowed_hosts', '127.0.0.1'),
  $nrpe_commands = hiera_hash('icinga2::nrpe:commands'),
){

  package { ['libnagios-plugin-perl', 'nagios-nrpe-server', 'nagios-plugins-basic', 'nagios-plugins-common', 'nagios-plugins-contrib', 'nagios-plugins-standard']:
      ensure  => 'latest',
  } ->

  file { "/etc/nagios/nrpe.cfg":
    ensure  => 'present',
    mode    => '0644',
    content => template('icinga2/nrpe.cfg.erb'),
  } ~>

  service { 'nagios-nrpe-server':
    ensure     => 'running',
  }

  create_resources('icinga2::nrpe::command', $nrpe_commands)
}
