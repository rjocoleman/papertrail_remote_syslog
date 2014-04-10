require_relative '../../spec_helper'

describe 'papertrail_remote_syslog::service' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'enable remote_syslog service' do
    expect(chef_run).to enable_service('remote_syslog')
  end

  it 'start remote_syslog service' do
    expect(chef_run).to start_service('remote_syslog')
  end

  it 'creates init file' do
    expect(chef_run).to create_cookbook_file('/etc/init.d/remote_syslog')
  end

  it 'creates upstart file based on attrbiute override' do
    chef_run.node.set['remote_syslog']['init_style'] = 'upstart'
    chef_run.converge(described_recipe)

    expect(chef_run).to create_template('/etc/init/remote_syslog.conf')
  end

end
