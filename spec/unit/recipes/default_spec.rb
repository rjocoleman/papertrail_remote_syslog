require_relative '../../spec_helper'

describe 'papertrail_remote_syslog::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs remote_syslog gem' do
    expect(chef_run).to install_gem_package('remote_syslog')
  end
end
