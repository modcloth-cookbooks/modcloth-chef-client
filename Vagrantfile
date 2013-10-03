# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'modcloth-chef-client-berkshelf'
  config.vm.box = 'canonical-ubuntu-12.04'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.network :private_network, ip: '33.33.33.10'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
      'recipe[modcloth-chef-client::default]'
    ]
  end
end
