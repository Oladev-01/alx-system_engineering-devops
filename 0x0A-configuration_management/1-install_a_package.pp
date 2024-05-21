# this puppet script automates the installation of flask version 2.1.0 from pip3

package { 'python3-pip':
    ensure => installed,
    }

exec { 'flask_installation':
    command => '/usr/bin/pip3 install flask==2.1.0 werkzeug==0.16.1',
    path    => ['/usr/bin', '/usr/sbin'],
    unless  => '/usr/bin/pip3 show flask | grep -q -i "version: 2.1.0"',
    require => Package['python3-pip']}
