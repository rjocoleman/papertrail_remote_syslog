# papertrail_remote_syslog Chef Cookbook

[![Build Status](https://travis-ci.org/rjocoleman/papertrail_remote_syslog.svg?branch=master)](https://travis-ci.org/rjocoleman/papertrail_remote_syslog)

A Chef cookbook to install [remote_syslog](https://github.com/papertrail/remote_syslog/) - a ruby daemon to transmit logs to papertrailapp.com

Currently supports only init and upstart.


# Attributes

Attributes listed with their default values:

```ruby
default['remote_syslog']['init_style'] = 'init'
default['remote_syslog']['conf']['files'] = []
default['remote_syslog']['destination']['host'] = 'logs.papertrailapp.com'
default['remote_syslog']['destination']['port'] = '12345'
default['remote_syslog']['hostname'] = node['hostname']
default['remote_syslog']['exclude_files'] = []
default['remote_syslog']['parse_fields'] = nil
default['remote_syslog']['prepend'] = nil
default['remote_syslog']['exclude_patterns'] = []
```

`node['remote_syslog']['conf']['files']`, `node['remote_syslog']['conf']['exclude_files']` and `node['remote_syslog']['conf']['exclude_patterns']` are all arrays.
These attributes are transformed into the [yaml config file](https://github.com/papertrail/remote_syslog/blob/master/examples/log_files.yml.example.advanced).


# Recipes

* `papertrail_remote_syslog::default` meta recipe to install, configures and enables+runs upstart/init scripts.
* `papertrail_remote_syslog::configure` just create configuration file from attributes.
* `papertrail_remote_syslog::service` just enabled+run upstart/init script.


## Contributing

* File bug reports via GitHub issues.
* Pull requests are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Attribution

This cookbook was based on and forked from the [remote_syslog cookbook](https://github.com/bbg-cookbooks/remote_syslog). It has since diverged and is not compatible.
