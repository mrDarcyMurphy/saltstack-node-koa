saltstack-node-koa
==================

This is still a work in progres, as are my sysadmin skills. If you've got any ideas or suggestions on how to improve things, make an issue or [ping me](https://twitter.com/mrDarcyMurphy).

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
* Run the app via pm2.

### TODO

* Start the app with pm2 with harmony flag turned on. It's easy enough to do manually, but has proved more difficult than expected through saltstack.
* Setup nginx. When I get pm2 to do it's thing, then I run into the issue of node not having access to port 80. So... nginx ftw.

### Caveats

* This is only a proof of concept.
* It probably isn't ready for production
* You'll probably want to secure your minion too.
* And maybe build an actual app. Maybe.
