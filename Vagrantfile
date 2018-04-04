# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "centos7.2"
  
  
  config.vm.define :master01 do |node|
    node.vm.network :private_network, ip:"192.168.20.19"
    node.vm.hostname = "aws-mock"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/vagrant/provision"
    ansible.playbook = "playbook.yml"
    ansible.verbose = true
    ansible.install = true
    ansible.limit = "all" # or only "nodes" group, etc.
  end
  config.vm.provision "shell", run: "always" do |s|
    s.inline = "sudo /usr/local/bin/docker-compose -f /opt/localstack/docker-compose.yml start"
  end
end
