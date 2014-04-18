# # see README - demonstrates all optional arguments and more glob formats
# files:
#   - /var/log/httpd/access_log
#   - /var/log/httpd/error_log
#   - /opt/misc/*.log
#   - /home/**/*.log
#   - /var/log/mysqld.log
#   - /var/run/mysqld/mysqld-slow.log
# exclude_files:
#   - old
#   - 200\d
# hostname: www42  # override OS hostname
# parse_fields: syslog   # predefined regex name or double-quoted regex
# prepend: '0xDEADBEEF: '  # prepend this before every log message
# exclude_patterns:
#   - exclude this
#   - \d+ things
# destination:
#   host: logs.papertrailapp.com
#   port: 12345   # NOTE: change this to YOUR papertrail port!
# new_file_check_interval: 5 # Check every 5 seconds

config = {
  'files'                   => node['remote_syslog']['conf']['files'].to_a,
  'exclude_files'           => node['remote_syslog']['exclude_files'].to_a,
  'hostname'                => node['remote_syslog']['hostname'],
  'parse_fields'            => node['remote_syslog']['parse_fields'],
  'prepend'                 => node['remote_syslog']['prepend'],
  'exclude_patterns'        => node['remote_syslog']['exclude_patterns'].to_a,
  'destination'             => node['remote_syslog']['destination'].to_hash,
  'new_file_check_interval' => node['remote_syslog']['new_file_check_interval']
}

file '/etc/log_files.yml' do
  owner 'root'
  group 'root'
  mode '0644'
  content config.to_yaml
end
