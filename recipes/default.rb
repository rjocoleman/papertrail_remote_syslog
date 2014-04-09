gem_package 'remote_syslog'
include_recipe 'papertrail_remote_syslog::configure'
include_recipe 'papertrail_remote_syslog::service'
