# apache_hardening (Puppet module)

## Description

This module provides hardening configuration for Apache2 web server.

## Requirements

* Puppet
* Supported module: `puppetlabs/apache` 


## Parameters

none

## Usage

Include the module

```
class { 'apache':
  default_mods => false,
}

class { 'apache_hardening':
  provider => 'puppetlabs/apache'
}
```

## Contributors + Kudos

* Edmund Haselwanter [ehaselwanter](https://github.com/ehaselwanter)

## License and Author

* Author:: Markus Schmall <markus-schmall@t-online.de>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
