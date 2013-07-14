node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'siproxd':
    require => Notify['enduser-before'],
    before  => Notify['enduser-after'],
  }

}
