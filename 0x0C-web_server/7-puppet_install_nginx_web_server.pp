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
    command  => "sed -i '/server_name .*$/a \\n    location /redirect_me {\n        return 301 https://example.com/new-page;\n    }\n' ${conf_file}",
    unless   => "/bin/grep -q 'location /redirect_me' ${conf_file}",
    provider => 'shell',
    require  => Package['nginx'],
    notify   => Service['nginx'],
}
