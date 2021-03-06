case node['remote_syslog']['init_style']
when 'init'
  cookbook_file '/etc/init.d/remote_syslog' do
    source 'remote_syslog.init.d'
    owner 'root'
    group 'root'
    mode '0755'
  end
  service 'remote_syslog' do
    action [:start, :enable]
  end
when 'upstart'
  template '/etc/init/remote_syslog.conf' do
    source 'remote_syslog.upstart.conf.erb'
    owner 'root'
    group 'root'
    mode '0755'
  end
  service 'remote_syslog' do
    provider Chef::Provider::Service::Upstart
    action [:start, :enable]
  end
else
  fail 'Unsupported init style'
end
