class siproxd::install (
  $package_ensure = $siproxd::package_ensure,
  $package_name   = $siproxd::package_name,
) inherits siproxd {

  package { 'siproxd':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
