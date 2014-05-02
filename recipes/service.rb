## upstart config
template '/etc/init/docker-registry.conf' do
  source 'docker-registry.conf.erb'
  mode   '0400'
  notifies :restart, 'service[docker-registry]', :delayed
end

## start the sinatra service
service 'docker-registry' do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :restart => true, :stop => true, :status => true
  action [ :enable, :start ]
end
