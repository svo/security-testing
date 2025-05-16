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
      docker.create_args = ['--dns', '10.6.6.8', '--dns', '8.8.8.8']
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
      docker.create_args = ['--dns', '10.6.6.8', '--dns', '8.8.8.8']
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

  config.vm.define 'dnsmasq' do |dnsmasq|
    dnsmasq.vm.provider :docker do |docker|
      docker.image = 'dockurr/dnsmasq'
      docker.has_ssh = false
      docker.pull = true
      docker.volumes = [
        "#{Dir.pwd}/dnsmasq.conf:/etc/dnsmasq.conf"
      ]
    end
    dnsmasq.vm.hostname = 'security-testing-dnsmasq'
    dnsmasq.vm.network :private_network, ip: '10.6.6.8'
  end

  config.vm.define 'juice-shop' do |juice_shop|
    juice_shop.vm.provider :docker do |docker|
      docker.image = 'bkimminich/juice-shop'
      docker.has_ssh = false
      docker.pull = true
      docker.ports = ['3000:3000']
      docker.create_args = [
        '--memory=256m',
        '--cpu-shares=50',
        '--ulimit', 'nofile=1024:2048'
      ]
    end
    juice_shop.vm.hostname = 'security-testing-juice-shop'
    juice_shop.vm.network :private_network, ip: '10.6.6.9'
  end

  config.vm.define 'webgoat' do |webgoat|
    webgoat.vm.provider :docker do |docker|
      docker.image = 'webgoat/webgoat'
      docker.has_ssh = false
      docker.pull = true
      docker.ports = ['3001:8080']
    end
    webgoat.vm.hostname = 'security-testing-webgoat'
    webgoat.vm.network :private_network, ip: '10.6.6.10'
  end

  config.vm.define 'hackazon' do |hackazon|
    hackazon.vm.provider :docker do |docker|
      docker.image = 'ianwijaya/hackazon'
      docker.has_ssh = false
      docker.pull = true
      docker.ports = ['3002:80', '3003:443']
    end
    hackazon.vm.hostname = 'security-testing-hackazon'
    hackazon.vm.network :private_network, ip: '10.6.6.11'
  end
end
