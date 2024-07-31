# creating a new User
exec {'increasing hard limit for holberton':
    command => "sed -i '/^holberton hard/s/[0-9]\\+/4096/' /etc/security/limits.conf",
    path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
}

exec {'increasing for soft limit':
    command => "sed -i '/^holberton soft/s/[0-9]\\+/4096/' /etc/security/limits.conf",
    path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
}
