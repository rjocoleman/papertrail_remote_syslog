require_relative '../../spec_helper'

describe 'papertrail_remote_syslog::configure' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates log_files.yml config file' do
    expect(chef_run).to create_file('/etc/log_files.yml')
  end
end
