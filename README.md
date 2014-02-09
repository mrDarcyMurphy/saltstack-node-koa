saltstack-node-koa
==================


## Local Development

To begin:

1. Install Vagrant and Virtual Box.
2. `vagrant up`
3. `vagrant ssh`
4. `sudo salt-call --local state.highstate`

This will:

* Create the virtual machine, based on ubuntu 12.04.
* Symlink the saltstack configuration to /etc/salt and /srv/salt.
* Compile and Install node-v0.11.11.
* Clone a koa based app.
* Run the app.

### Caveats

* This is only a proof of concept.
* It probably isn't ready for production
* It's probably unnecessary to *build* node, but whatever.
* The koa app isn't using forever or pm2 to monitor the app.
* You'll probably want to secure your minion.
* And maybe build an actual app. Maybe.
