# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: apache_hardening::puppetlabs_override
#
# Overlay provider for puppetlabs/apache
#
# === Parameters
#
# none
#
class apache_hardening::puppetlabs_override (

    $server_signature    = 'Off',
    $server_tokens       = 'Prod',
    $trace_enable        = 'Off',

) inherits ::apache {

  File["${::apache::conf_dir}/${::apache::params::conf_file}"]{
    content => template('apache_hardening/httpd.conf.erb'),
    mode   => '0640',
  }
}
