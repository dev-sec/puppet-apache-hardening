# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: apache_hardening
#
# Configures overlay hardening
#
# === Parameters
#
# [*provider*]
#   The name of the provider you use to install nginx.
#   Supported: `puppetlabs/apache`
#
class apache_hardening(
  $provider = 'none',
) {
  case $provider {
    'puppetlabs/apache': {
      class{'apache_hardening::puppetlabs': }
    }
    'none': {
      fail('You haven\'t configured a Apache provider for hardening.')
    }
    default: {
      fail('Unrecognized/Unsupported Apache provider for hardening.')
    }
  }
}
