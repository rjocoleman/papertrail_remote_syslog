case node['remote_syslog']['init_style']
when 'init'
  cookbook_file '/etc/init.d/remote_syslog' do
    source 'remote_syslog.init'
    owner 'root'
    group 'root'
    mode '0755'
  end
  service 'remote_syslog' do
    action [:start, :enable]
  end
when 'upstart'
  cookbook_file '/etc/init/remote_syslog.conf' do
    source 'remote_syslog.upstart.conf'
    owner 'root'
    group 'root'
    mode '0755'
  end
  service 'remote_syslog' do
    provider Chef::Provider::Service::Upstart
    action [:start, :enable]
  end
else
  raise 'Unsupported init style'
end
