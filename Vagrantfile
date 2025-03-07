# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'tooling', primary: true do |tooling|
    tooling.vm.provider :docker do |docker|
      docker.image = 'dockette/vagrant:debian-12'
      docker.has_ssh = true
      docker.pull = true
      docker.volumes = [
        '/var/run/docker.sock:/var/run/docker.sock'
      ]
      docker.create_args = ['--dns', '8.8.8.8', '--dns', '10.6.6.7']
      docker.privileged = true
    end

    tooling.vm.hostname = 'security-testing-tooling'
    tooling.vm.network :private_network, ip: '10.6.6.6'

    tooling.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'infrastructure/ansible/playbook.yml'
      ansible.extra_vars = {
        ansible_python_interpreter: '/usr/bin/python3'
      }
    end
  end

  config.vm.define 'victim' do |victim|
    victim.vm.provider :docker do |docker|
      docker.image = 'dockette/vagrant:debian-12'
      docker.has_ssh = true
      docker.pull = true
      docker.volumes = [
        '/var/run/docker.sock:/var/run/docker.sock'
      ]
      docker.create_args = ['--dns', '8.8.8.8', '--dns', '10.6.6.7']
      docker.privileged = true
    end

    victim.vm.hostname = 'security-testing-victim'
    victim.vm.network :private_network, ip: '10.6.6.7'

    victim.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'infrastructure/ansible/playbook-victim.yml'
      ansible.extra_vars = {
        ansible_python_interpreter: '/usr/bin/python3',
        pwd: "#{Dir.pwd}"
      }
    end
  end
end
