# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: apache_hardening::puppetlabs
#
# Overlay provider for puppetlabs/apache
#
# === Parameters
#
# none
#
class apache_hardening::puppetlabs(
  $allowed_http_methods = [
    'GET',
    'POST',
  ]
) {

  # make sure our options are written to the config file
  class{'::apache_hardening::puppetlabs_override': }

  # additional configuration

  # add hardening parameters

  $apache_version = $apache::apache_version
  $confd_dir = $apache::confd_dir
  $conf_dir = $apache::conf_dir
  $mod_dir = $apache::mod_dir
  $icons_path = $apache::mod::alias::icons_path
  $icons_options = '-Indexes +MultiViews -FollowSymLinks' # overwrites $apache::mod::alias::icons_options

  file { "${confd_dir}/90.hardening.conf":
    ensure  => file,
    content => template('apache_hardening/hardening.conf.erb'),
    mode    => '0640',
  }

  File <| notify  == Service['httpd'] or notify == Class['::apache::service'] or require == Package['httpd'] |>  {
    mode  => '0640'
  }

  Concat <| require == Package['httpd'] |>  {
    mode  => '0640'
  } -> Exec["chmod -R o-rw ${conf_dir}"] ~> Service['httpd']


  exec { "chmod -R o-rw ${conf_dir}":
    path   => ['/bin','/usr/bin', '/usr/sbin'],
    unless => "find ${conf_dir} -perm -o+r -type f -o -perm -o+w -type f | wc -l | egrep '^0$'",
  }

  File <| title == 'alias.conf' |> {
    content => template('apache/mod/alias.conf.erb'),
    mode   => '0640',
  }

}
