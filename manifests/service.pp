class siproxd::service (
  $service_enable           = $siproxd::service_enable,
  $service_ensure           = $siproxd::service_ensure,
  $service_manage           = $siproxd::service_manage,
  $service_name             = $siproxd::service_name,
  $service_default_file     = $siproxd::service_default_file,
  $service_default_template = $siproxd::service_default_template,
) inherits siproxd {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_manage {
    service { 'siproxd':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
      require    => File[$siproxd::config],
    }

    if $::osfamily == 'Debian' {
      file { $service_default_file:
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template($service_default_template),
      }
    }

  }

}

