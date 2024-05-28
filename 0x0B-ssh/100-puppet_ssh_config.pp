# Define the SSH configuration using Puppet
file { '/etc/ssh/ssh_config':
    ensure  => present,
    content => template('/home/oladev-01/alx-system_engineering-devops/0x0B-ssh/ssh_config_temp.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',}

