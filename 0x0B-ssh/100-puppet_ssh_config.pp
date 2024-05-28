# Define the SSH configuration using Puppet
file { "/etc/ssh/ssh_config ":
    ensure => present,
    content => "  IdentityFile ~/alx-system_engineering-devops/0x0B-ssh/school
                  HostName 18.209.152.56
                  PasswordAuthentication no",}

