# this puppet script aims to use strace to debug server error

file { '/etc/apache2/sites-available/000-default.conf':
  ensure => 'file',
  source => 'puppet:///modules/apache/000-default.conf',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  notify => Service['apache2'],
}

service { 'apache2':
  ensure => 'running',
  enable => true,
}
