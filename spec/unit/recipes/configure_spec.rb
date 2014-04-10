require_relative '../../spec_helper'

describe 'papertrail_remote_syslog::configure' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:yml) { IO.read 'spec/data/valid.yml' }

  it 'creates log_files.yml config file' do
    expect(chef_run).to create_file('/etc/log_files.yml')
  end

  it 'creates a well formed config file' do
    chef_run.node.set['remote_syslog']['conf']['files'] = [
      '/var/log/httpd/access_log', '/var/log/httpd/error_log',
      '/opt/misc/*.log', '/home/**/*.log', '/var/log/mysqld.log',
      '/var/run/mysqld/mysqld-slow.log'
    ]
    # rubocop:disable LineLength
    chef_run.node.set['remote_syslog']['destination']['host'] = 'logs.papertrailapp.com'
    # rubocop:enable LineLength
    chef_run.node.set['remote_syslog']['destination']['port'] = 12345
    chef_run.node.set['remote_syslog']['hostname'] = 'www42'
    chef_run.node.set['remote_syslog']['exclude_files'] = ['old', '200d']
    chef_run.node.set['remote_syslog']['parse_fields'] = 'syslog'
    chef_run.node.set['remote_syslog']['prepend'] = '0xDEADBEEF: '
    chef_run.node.set['remote_syslog']['exclude_patterns'] = [
      'exclude this', 'd+ things'
    ]
    chef_run.node.set['remote_syslog']['new_file_check_interval'] = 5
    chef_run.converge(described_recipe)

    expect(chef_run).to render_file('/etc/log_files.yml').with_content(yml)
  end
end
