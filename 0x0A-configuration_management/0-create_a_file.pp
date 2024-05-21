# this script automates the creation of a file, setting
# the file's permission and also the file's
#  ownwer and group owner

file { '/tmp/school':
    ensure  => file,
    mode    => '0744',
    owner   => 'www-data',
    group   => 'www-data',
    content => 'I love Puppet',
    }
