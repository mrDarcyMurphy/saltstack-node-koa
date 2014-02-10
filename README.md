saltstack-node-koa
==================

If this helped you, please let me know.

## To Begin

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

### TODO

* create an unprivileged user to boot the app
* find a better way to install pm2.
* put necessary pm2 configuration in that user's `~/.pm2/custom_options.sh` [*](https://github.com/Unitech/pm2#configuration--customization)
* alternatively, try pm2's [json configuration](https://github.com/Unitech/pm2#multi-process-json-declaration).
* start the app with pm2 with harmony flag turned on.
* ensure the port works right, and heck, maybe even forward it to the host.

### Caveats

* This is only a proof of concept.
* It probably isn't ready for production
* It's probably unnecessary to *build* node, but whatever.
* You'll probably want to secure your minion.
* And maybe build an actual app. Maybe.
