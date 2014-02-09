#!/bin/bash

# On a real server
# I'd probably clone th repo to /src
# then create symbolic links from there instead of vagrant
# ln -s /src/saltstack-node-koa/etc/salt /etc/salt
# ln -s /src/saltstack-node-koa/srv /srv

# vagrant symlinks
ln -s /vagrant/etc/salt /etc/salt
ln -s /vagrant/srv/salt /srv/salt