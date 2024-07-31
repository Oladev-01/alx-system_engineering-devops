# creating a new User
exec {'creating holberton':
    command => 'useradd -m holberton',
    path    => ['/usr/bin', '/bin', '/usr/sbin'],
}
