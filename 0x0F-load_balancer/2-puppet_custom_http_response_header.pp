# Ensure Nginx is installed
package { 'nginx':
  ensure => 'installed',
}

# Configure Nginx to add a custom response header
exec { 'add_custom_header':
  command => 'sed -i "/listen 80 .*$/a \\    add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  unless  => 'grep -q "add_header X-Served-By" /etc/nginx/sites-available/default',
  provider => 'shell',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure the service is running and enabled
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  require   => Package['nginx'],
}
