## libs for building python deps
%w[ git build-essential libevent-dev libssl-dev liblzma-dev libffi-dev python-dev python-pip ].each do |pkg|
  package pkg
end

## installation dir
directory '/opt/docker-registry' do
  owner node[:docker_registry_simple][:user]
  group node[:docker_registry_simple][:group]
end

## clone the repo
git '/opt/docker-registry' do
  repository 'https://github.com/dotcloud/docker-registry.git'
  reference  node[:docker_registry_simple][:version]
  user       node[:docker_registry_simple][:user]
  group      node[:docker_registry_simple][:group]
  action     :checkout
  notifies   :run, 'bash[docker-registry-pip-requirements]', :immediately
end

## install python deps
bash 'docker-registry-pip-requirements' do
  cwd 'opt/docker-registry'
  code 'pip install -r requirements.txt'
  action :nothing
end

## log dir
directory '/var/log/docker-registry' do
  owner node[:docker_registry_simple][:user]
  group node[:docker_registry_simple][:group]
end
