# This script resolves the cause of the failed requests by increasing the file descriptor limit and restarting Nginx.

exec {'fix-limit':
  command => "sed -i 's/ULIMIT=\"-n [0-9]\\+\"/ULIMIT=\"-n 4096\"/' /etc/default/nginx",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}

exec {'restarting nginx':
  command => 'service nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
