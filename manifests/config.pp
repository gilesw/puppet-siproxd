class siproxd::config (
  $config            = $siproxd::config,
  $config_template   = $siproxd::config_template,
  $if_inbound        = $siproxd::if_inbound
  $if_outbound       = $siproxd::if_outbound
  $chrootjail        = $siproxd::chrootjail
  $registration_file = $siproxd::registration_file
) inherits siproxd {

  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }

}
