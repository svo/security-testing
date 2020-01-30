# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/debian-9.5'

  config.vm.hostname = 'security-testing'

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'configuration-management/ansible/playbook.yml'
  end

  config.cache.scope = :machine if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 4
    vb.memory = 4096
  end
end
