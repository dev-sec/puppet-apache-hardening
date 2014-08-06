# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: apache_hardening
#
# Configures apache hardening
#
#
# Creates a valid apache2.conf, a virtual SSL host with correct SSL settings
#

class apache_hardening
{

  class { 'apache':
    default_mods        => false,
    default_confd_files => false,
    server_signature => Off,
    server_tokens => Prod,
    trace_enable => Off,
  }


  #
  # pure redirecting host from http to https
  #
  apache::vhost { 'dtag':
    port     => '80',
    docroot  => '/var/www/',
    ssl      => true,

  }

  #
  # https enabled hosts
  #
  apache::vhost { 'dtag-ssl':
    port     => '443',
    docroot  => '/var/www/',
    ssl      => true,

    #
    #  configure SSL parameters (ssl cyphers taken from great bettercrypto.org side)
    #

    ssl_protocol =>  'All -SSLv2 -SSLv3',
    ssl_honorcipherorder => On,
    ssl_cipher => "EDH+CAMELLIA:EDH+aRSA:EECDH+aRSA+AESGCM:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:+CAMELLIA256:+AES256:+CAMELLIA128:+AES128:+SSLv3:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!DSS:!RC4:!SEED:!ECDSA:CAMELLIA256-SHA:AES256-SHA:CAMELLIA128-SHA:AES128-SHA",

  }

} # class apache-hardning

include apache_hardening
