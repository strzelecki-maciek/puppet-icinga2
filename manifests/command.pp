# == Define: icinga2::command

define icinga2::command (
  $command_line,
  $command_name = $name,
  ) {
  file { "/etc/nagios/nrpe.d/${name}.cfg":
    ensure  => 'present',
    group   => 'root',
    mode    => '0644',
    owner   => 'root',
    content => template('icinga2/command.cfg.erb'),
    notify  => Service['nagios-nrpe-server'],
  }
}

