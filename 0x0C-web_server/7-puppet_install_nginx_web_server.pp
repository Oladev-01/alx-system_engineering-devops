# this puppet configures the nginx for redirection...
# ensure nginx is installed

$conf_file = '/etc/nginx/sites-enabled/default'
package { 'nginx':
    ensure => installed,
}

# ensure the nginx config file exits
file { $conf_file:
    ensure => file,
    notify => Service['nginx'],
}

# ensure nginx is running and enabled
service { 'nginx':
    ensure    => running,
    enable    => true,
    require   => Package['nginx'],
    subscribe => File[$conf_file],
}

# ensure that the file for the landing page is present
file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    mode    => '0644',
    notify  => Service['nginx'],
}

# executing the sed command to redirect
exec { 'redirection':
  command     => "/bin/bash -c \"sed -i '/server_name _;/a \\\n    location /redirect_me {\\\\n        return 301 https://example.com/new-page;\\\\n    }\\\\n' ${conf_file}\"",
  unless      => "/bin/grep -q 'location /redirect_me' ${conf_file}",
  require     => Package['nginx'],
  notify      => Service['nginx'],
  environment => ['conf_file=/etc/nginx/sites-enabled/default'],
}

# ensure nginx is listening on port 80
exec { 'listen_on_port_80':
  command     => "/bin/bash -c \"sed -i 's|listen 80;|listen 80 default_server;|' ${conf_file}\"",
  unless      => "/bin/grep -q 'listen 80 default_server;' ${conf_file}",
  require     => Package['nginx'],
  notify      => Service['nginx'],
  environment => ['conf_file=/etc/nginx/sites-enabled/default'],
}
