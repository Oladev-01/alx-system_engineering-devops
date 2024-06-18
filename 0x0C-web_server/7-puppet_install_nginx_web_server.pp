# Setup New Ubuntu server with nginx
#update the server
exec { 'update system':
    command => '/usr/bin/apt-get update',
}
# ensure Nginx is installed
package { 'nginx':
    ensure  => 'installed',
    require => Exec['update system']
}
# landing page
file {'/var/www/html/index.html':
    content => 'Hello World!',
    require => Package['nginx'],
}
# custom page
file { '/var/www/html/custom_404.txt':
    ensure  => file,
    content => "Ceci n'est pas une page",
    require => Package['nginx'],
}
# making a redirection
exec { 'redirect_me':
  command  => 'sed -i "/server_name _;/a    location /redirect_me {\n        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\\n    }" /etc/nginx/sites-available/default',
  unless   => 'grep -q "location /redirect_me" /etc/nginx/sites-available/default',
  provider => 'shell',
  require  => Package['nginx'],
}

# custom error page
exec { 'custom 404':
  command  => 'sed -i "/^\s*location \/ {$/a     error_page 404 /custom_404.txt;\n    location = /custom_404.txt {\\n        internal;\\n    }" /etc/nginx/sites-available/default',
  unless   => 'grep -q "error_page 404" /etc/nginx/sites-available/default',
  provider => 'shell',
  require  => Package['nginx'],
}
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  require => Package['nginx'],
}
exec { 'add_custom_header':
  command => 'sed -i "/listen 80 .*$/a \\    add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  unless  => 'grep -q "add_header X-Served-By" /etc/nginx/sites-available/default',
  provider => 'shell',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Remove existing symlink if it exists
file { '/etc/nginx/sites-enabled/default':
  ensure  => 'absent',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx']
}

# Create symlink to enable the site
file { '/etc/nginx/sites-enabled/default-link':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx']
}
# enable and restart nginx
service {'nginx':
    ensure    => running,
    enable    => true,
    require   => [Package['nginx'], File['/etc/nginx/sites-enabled/default-link']],
    subscribe => [File['/var/www/html/index.html'], File['/var/www/html/custom_404.txt'], Exec['redirect_me'], Exec['custom 404'],]
}
