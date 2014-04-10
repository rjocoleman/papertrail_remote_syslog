# config file attributes
default['remote_syslog']['conf']['files'] = []
default['remote_syslog']['destination']['host'] = 'logs.papertrailapp.com'
default['remote_syslog']['destination']['port'] = '12345'
default['remote_syslog']['hostname'] = node['hostname']
default['remote_syslog']['exclude_files'] = []
default['remote_syslog']['parse_fields'] = nil
default['remote_syslog']['prepend'] = nil
default['remote_syslog']['exclude_patterns'] = []
default['remote_syslog']['new_file_check_interval'] = 5

# other
default['remote_syslog']['init_style'] = 'init'
default['remote_syslog']['executable_directory'] = '/var/lib/gems/1.8/bin'
