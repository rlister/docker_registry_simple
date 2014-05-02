default[:docker_registry_simple][:version] = '0.6.8'

default[:docker_registry_simple][:user]    = 'www-data'
default[:docker_registry_simple][:group]   = 'www-data'

## this is emitted as yaml for the config.yml file
default[:docker_registry_simple][:config] = {
  :common => {
    :secret_key => 'REPLACEME',
    :standalone => true,
  },

  :dev => {
    :storage => 'local',
    :storage_path => '/tmp/registry',
    :loglevel => 'debug',
  },

  :prod => {
    :storage => 'local',
    :storage_path => '/data/registry',
    :loglevel => 'info',
    :cache => {
      :host => 'localhost',
      :port => 6379,
    },
    :cache_lru => {
      :host => 'localhost',
      :port => 6379,
    },
  },
  
}
