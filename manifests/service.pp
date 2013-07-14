class siproxd::service (
  $service_enable = $siproxd::service_enable,
  $service_ensure = $siproxd::service_ensure,
  $service_manage = $siproxd::service_manage,
  $service_name   = $siproxd::service_name,
) inherits siproxd {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_manage == true {
    service { 'siproxd':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}

