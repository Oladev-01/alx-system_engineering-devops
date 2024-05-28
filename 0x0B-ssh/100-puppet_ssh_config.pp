# Define the SSH configuration using Puppet
file { "/home/oladev-01/.ssh/config":
    ensure => present,
    content => "host *
                  IdentityFile ~/alx-system_engineering-devops/0x0B-ssh/schoolHostName 18.209.152.56
                  HostName 18.209.152.56
                  PasswordAuthentication no",}

