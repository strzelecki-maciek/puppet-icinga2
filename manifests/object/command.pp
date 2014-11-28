# define: icinga2::nrpe::command
define icinga2::nrpe::command(
  $command_line,
  $command_name = $name,
  $ensure       = present,
  $group        = 'root',
  $mode         = '0644',
  $owner        = 'root',
  $target       = "/etc/nagios/nrpe.d/${name}.cfg",
  ) {
  file { $target:
    ensure  => $ensure,
    path    => $target,
    group   => $group,
    mode    => $mode,
    owner   => $owner,
    content => template('icinga2/command.cfg.erb'),
    notify  => Service['nagios-nrpe-server'],
  }
}

