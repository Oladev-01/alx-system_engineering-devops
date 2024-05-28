# Define the SSH configuration using Puppet
file { '/etc/ssh/ssh_config':
    ensure  => present,
    content => template('./ssh_config_temp'),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',}

