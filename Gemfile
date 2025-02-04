source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV['PUPPET_VERSION']
if puppetversion
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

group :test do
  gem 'rake'
  gem 'rspec', '< 3.13.1'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'puppetlabs_spec_helper'
  gem 'metadata-json-lint'
  gem 'rspec-puppet-facts'
  gem 'rubocop', '1.71.2'
  gem 'puppet-lint'
end

group :development do
  gem 'travis'
  gem 'travis-lint'
  gem 'puppet-blacksmith'
  gem 'guard-rake'
  gem 'listen', '< 3.9.1'
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-puppet'
  gem 'librarian-puppet'
  gem 'kitchen-sharedtests', '~> 0.2.0'
end

group :openstack do
  gem 'kitchen-openstack'
end

group :system_tests do
  gem 'beaker'
  gem 'beaker-rspec'
  gem 'beaker-puppet_install_helper'
end
