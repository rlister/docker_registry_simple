# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'base'
  config.vm.network :forwarded_port, host: 8080, guest: 80
  config.vm.network :forwarded_port, host: 5050, guest: 5000

  ## if we have an old box, fix it up to make sure up to date packages are available
  config.vm.provision :shell, inline: 'sudo apt-get update'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = '..'
    chef.data_bags_path = 'data_bags'
    chef.add_recipe 'docker_registry_simple'
    chef.json = {
      docker_registry_simple: {
        config: {
          common: {
            secret_key: 'SOME_SECRET',
            standalone: true,
          },
          dev: {
            storage: local,
            storage_path: '/tmp/registry',
            loglevel: debug,
          }
        }
      }
    }
  end

end
