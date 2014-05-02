## write config file from config attribute
## feat. craptaculous hack to get clean yaml from nested Mashes

file '/opt/docker-registry/config/config.yml' do
  content YAML::dump(JSON.parse(node[:docker_registry_simple][:config].to_hash.dup.to_json))
  owner   node[:docker_registry_simple][:user]
  group   node[:docker_registry_simple][:group]
end
