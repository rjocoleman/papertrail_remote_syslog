## 0.3.3

* Fix incorrect config file generation
* Add test to ensure configure file is valid (to sample known good)
* Style improvements (Rubocop)


## 0.3.2

* update to newest remote_syslog example init script
* add new remote_syslog config setting - `new_file_check_interval`
* convert upstart to a template, add support for multiple executable dirs


## 0.3.1

* Rubocop style cleanup
* Simplify config yaml file generation
* Remove unused attributes


## 0.3.0

* Forked from upstream.
* Temporarily removed Jamie tests pending re-implementation with kitchen ci.
* Added support for upstart init scripts.
* Created README.md
* Refactored attributes to be consistent with newer versions of Chef.
* Changed the meta recipe.
* Re-do Chefspec from scratch (Chefspec 3.0).
* Add Travis CI


#### Forked from upstream.

Prior to v0.3.0 this was https://github.com/bbg-cookbooks/remote_syslog

## 0.2.0:

* Implementation of all current published remote_syslog configuration options

## 0.1.0:

* Initial release of remote_syslog
