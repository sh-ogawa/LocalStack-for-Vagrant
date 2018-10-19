# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "mvbcoding/awslinux"
  
  config.vm.define :master do |node|
    node.vm.network :private_network, ip:"192.168.20.19"
    node.vm.hostname = "aws-mock"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/vagrant/provision"
    ansible.playbook = "playbook.yml"
    ansible.verbose = true
    ansible.install = true
    ansible.limit = "all"
  end
  config.vm.provision "shell", run: "always" do |s|
    s.path  = "provision/service-start.sh"
  end
  config.vm.provision "ansible_local", run: "always" do |a|
    a.provisioning_path = "/vagrant/provision"
    a.playbook = "setup-localstack.yml"
    a.verbose = true
    a.limit = "all"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 3072
  end

end
