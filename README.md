saltstack-node-koa
==================


## Local Development

To begin:

1. Install Vagrant and Virtual Box.
2. `vagrant up`

This will:

* Create the virtual machine, based on ubuntu 12.04.
* Symlink the saltstack configuration to /etc/salt and /srv/salt.


### TODO

* Install node >= 0.11.9.
* nstall koa app dependencies.
* Run the app.


### Caveats

* This is only a proof of concept.
* You'll probably want to secure your minion.
* And maybe build an actual app. Maybe.