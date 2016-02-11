#
# Vagrant file for use with SaltStack
#
Vagrant.configure("2") do |config|

  ## Choose your base box
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "saltstack/", "/srv"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    # call state.highstate in local mode
    salt.masterless = true

    # most important in this file is the option file_client: local
    salt.minion_config = "etc/unicorn"

    # execute highstate on start
    salt.run_highstate = false

    # install stable SaltStack
    salt.install_type = "stable"

    # default option when running boostrap script
    salt.bootstrap_options = "-P -c /tmp"

  end

  # enable port forward for host system
  config.vm.network "forwarded_port", guest: 5432, host: 5444

end
