Vagrant.require_version ">= 1.3.5"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # mmm...salty
  config.vm.define :saltykoa

  # Using Ubuntu as a base
  config.vm.box = "precise64"

  # Not sure about this yet, needs to be tested
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true


  # working around `stdin: is not a tty` issue in ubuntu
  # https://github.com/mitchellh/vagrant/issues/1673
  # ubuntu assumes a all shells are login shell,
  # but this isn't, so the shell provisioner will choke.
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # ensure git is installed
  config.vm.provision "shell", path: "symlink_salt_configs.sh"

  # Salt Provisioning
  # this box will run as a masterless minion
  config.vm.provision :salt do |salt|
    salt.verbose = true
    salt.minion_config = "./etc/salt/minion"
    # salt.run_highstate = true
  end

end