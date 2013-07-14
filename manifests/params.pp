class siproxd::params {

  $autoupdate     = false
  $package_ensure = 'present'
  $service_enable = true
  $service_ensure = 'running'
  $service_manage = true

  $if_inbound          = 'eth0'
  $if_outbound         = 'ppp0'
  $outbound_proxy_host = 'undef'

  case $::osfamily {
    'Debian': {
      $config            = '/etc/siproxd.conf'
      $config_template   = 'siproxd/siproxd.conf.debian.erb'
      $package_name      = [ 'siproxd' ]
      $service_name      = 'siproxd'
      $chrootjail        = '/var/lib/siproxd'
      $registration_file = '/var/lib/siproxd/siproxd_registrations'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
