# Class: siproxd
#
# This module manages siproxd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class siproxd (
  $autoupdate          = $siproxd::params::autoupdate,
  $config              = $siproxd::params::config,
  $config_template     = $siproxd::params::config_template,
  $package_ensure      = $siproxd::params::package_ensure,
  $package_name        = $siproxd::params::package_name,
  $if_inbound          = $siproxd::params::if_inbound,
  $if_outbound         = $siproxd::params::if_outbound,
  $outbound_proxy_host = $siproxd::params::outbound_proxy_host,
  $chrootjail          = $siproxd::params::chrootjail,
  $registration_file   = $siproxd::params::registration_file,
  $service_enable      = $siproxd::params::service_enable,
  $service_ensure      = $siproxd::params::service_ensure,
  $service_manage      = $siproxd::params::service_manage,
  $service_name        = $siproxd::params::service_name,
) inherits siproxd::params {
  include '::siproxd::install'
  include '::siproxd::config'
  include '::siproxd::service'
}
