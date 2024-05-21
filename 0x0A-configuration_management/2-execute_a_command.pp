# this script automates send the SIGKILL to the 'killmenow' process

exec { 'killmenow':
    command => 'pkill  -f killmenow',
    onlyif  => 'pgrep -f killmenow',
    path    => ['/usr/bin', '/usr/bin/sbin'],
    }