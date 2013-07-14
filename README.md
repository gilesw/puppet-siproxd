#siproxd

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with siproxd](#setup)
    * [What siproxd affects](#what-siproxd-affects)
    * [Beginning with siproxd](#beginning-with-siproxd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The siproxd module installs, configures, and manages the siproxd service.

##Module Description

The siproxd module handles running siproxd across a range of operating systems and
distributions.  Where possible we use the upstream siproxd templates so that the
results closely match what you'd get if you modified the package default conf
files.

##Setup

###What siproxd affects

* siproxd package.
* siproxd configuration file.
* siproxd service.

###Beginning with siproxd

include '::siproxd' is enough to get you up and running.

##Usage

All interaction with the siproxd module can do be done through the main siproxd class.
This means you can simply toggle the options in the siproxd class to get at the
full functionality.

###I just want siproxd, what's the minimum I need?

```puppet
include '::siproxd'
```

###I just want to tweak what interfaces are used for inbound and outbound traffic

```puppet
class { '::siproxd':
  if_inbound => 'eth0'
  if_outbound => 'eth1',
}
```

###Why are chrootjail and registration_file params available?

This bug still exists:-

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=506764

One workaround is to disable the chroot.

```puppet
class { '::siproxd':
  chrootjail        => '/'
  registration_file => '/var/lib/siproxd/var/lib/siproxd/siproxd_registrations',
}
```

##Reference

###Classes

* siproxd: Main class, includes all the rest.
* siproxd::install: Handles the packages.
* siproxd::config: Handles the configuration file.
* siproxd::service: Handles the service.

###Parameters

The following parameters are available in the siproxd module

####`autoupdate`

Deprecated: This parameter previously determined if the siproxd module should be
automatically updated to the latest version available.  Replaced by package\_
ensure.

####`config`

This sets the file to write siproxd configuration into.

####`config_template`

This determines which template puppet should use for the siproxd configuration.

####`package_ensure`

This can be set to 'present' or 'latest' or a specific version to choose the
siproxd package to be installed.

####`package_name`

This determines the name of the package to install.

####`service_enable`

This determines if the service should be enabled at boot.

####`service_ensure`

This determines if the service should be running or not.

####`service_manage`

This selects if puppet should manage the service in the first place.

####`service_name`

This selects the name of the siproxd service for puppet to manage.


##Limitations

This module has been built on and tested against Puppet 2.7 and higher.

The module has been tested on:

* Ubuntu 12.04

