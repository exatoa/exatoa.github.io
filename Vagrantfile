# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # currently there is no vagrant box for Singularity 3.8/Ubuntu 22.04
  config.vm.box = "generic/ubuntu2204"
  config.vm.provider :virtualbox
  config.vm.hostname = "ubuntu22"

  # The following command (official guideline) doesn't work
  # config.vm.disk :disk, size: "50GB", primary: true

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # This port setting is for the remote debugging (to assign the same port always)
  # Uncomment it to activate this setting
  config.vm.network "forwarded_port", guest: 22, host: 8888, id: 'ssh'

  # This port setting is for web service
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Display the VirtualBox GUI when booting the machine
    vb.cpus = "2"       # default was not specified

    # Customize the amount of memory on the VM:
    vb.memory = "4000"   #  the default was "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "containers/vagrant-default_environment.sh"

  # ** The following command needs for test. If you are going to use only singularity image, it doesn't need **
  # config.vm.provision "shell", path: "_containers/vagrant-install_requirements.sh"
  # config.vm.provision "shell", privileged: false, inline: "pip3 install -U -r /vagrant/containers/requirements.txt"
end
