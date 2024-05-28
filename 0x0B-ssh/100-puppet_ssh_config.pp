# Define the SSH configuration using Puppet
file { '/etc/ssh/ssh_config':
    ensure  => present,
    content => "Host 18.209.152.56
    User ubuntu
    Hostname 18.209.152.56
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
",
    owner   => 'root',
    group   => 'root',
    mode    => '0640',}

