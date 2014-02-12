Vagrant.require_version ">= 1.3.5"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # mmm...salty
  config.vm.define :saltykoa

  # Using Ubuntu as a base
  config.vm.box = "precise64"

  # Not sure about this yet, needs to be tested
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 1337, host: 1337, auto_correct: true

  # working around `stdin: is not a tty` issue in ubuntu
  # https://github.com/mitchellh/vagrant/issues/1673
  # ubuntu assumes a all shells are login shell, but this isn't, so the shell provisioner will choke.
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Shell Provisioning
  # On a real server, I'd clone this repo to /src
  # and symlink the config files to the right directories.
  #
  # The app could be included as it is in this example,
  # but would be better off configured as a saltstack state.
  config.vm.provision "shell", path: "bin/symlink_salt_configs.sh"
  config.vm.provision "shell", path: "bin/useradd_mercury.sh"

  # Salt Provisioning
  # This box will run as a masterless minion
  config.vm.provision :salt do |salt|
    salt.verbose = true
    salt.minion_config = "./etc/salt/minion"
    # this breaks, at the moment
    # salt.run_highstate = true
  end

end