# we require npm
# but can't declare it more than once, so include the state that does.
include:
  - npm

# install pm2 via npm
npm install -g pm2:
  cmd.run:
    - unless: test -e /usr/bin/pm2
    - require:
      - pkg: npm

pm2-custom-options:
  file.managed:
    - name: /home/mercury/.pm2/custom_options.sh
    - source: salt://npm/pm2/custom_options.sh
    - user: mercury

/home/mercury/.pm2:
  file.directory:
    - user: mercury
    - recurse:
      - user
