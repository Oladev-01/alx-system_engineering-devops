# creating a new User
user {'holberton':
    ensure     => present,
    managehome => true,
    password   => '1002',
    shell      => '/bin/bash',
    home       => '/home/holberton',
}

file {'/home/holberton':
    ensure  => directory,
    owner   => 'holberton',
    group   => 'holberton',
    mode    => '0755',
    require => User['holberton'],
}
