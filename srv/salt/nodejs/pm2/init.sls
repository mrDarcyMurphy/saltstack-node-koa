include:
  - nodejs

npm install -g pm2:
  cmd.run:
    - unless: test -e /usr/bin/pm2
    - require:
      - pkg: nodejs
      - pkg: build-essential

# This hangs for some reason, haven't debugged it yet.
# pm2-upstart:
#   cmd.run:
#     - name: pm2 startup ubuntu -u mercury
#     - unless: test -e /etc/init.d/pm2-init.sh
#     - require:
#       - pkg: nodejs

pm2-custom-options:
  file.managed:
    - name: /home/mercury/.pm2/custom_options.sh
    - source: salt://nodejs/pm2/custom_options.sh
    - user: mercury
    - group: mercury
