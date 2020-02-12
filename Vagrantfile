# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'tooling', primary: true do |tooling|
    tooling.vm.box = 'bento/debian-9.5'

    tooling.vm.hostname = 'security-testing'
    tooling.vm.network :private_network, ip: '10.6.6.6'

    tooling.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'configuration-management/ansible/playbook.yml'
    end

    tooling.cache.scope = :machine if Vagrant.has_plugin?('vagrant-cachier')

    tooling.vm.provider :virtualbox do |vb|
      vb.cpus = 2
      vb.memory = 1024
    end
  end

  config.vm.define 'victim' do |victim|
    victim.vm.box = 'bento/debian-9.5'

    victim.vm.hostname = 'security-testing-victim'
    victim.vm.network :private_network, ip: '10.6.6.7'

    victim.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'configuration-management/ansible/playbook-victim.yml'
    end

    victim.cache.scope = :machine if Vagrant.has_plugin?('vagrant-cachier')

    victim.vm.provider :virtualbox do |vb|
      vb.cpus = 4
      vb.memory = 4096
    end
  end
end
