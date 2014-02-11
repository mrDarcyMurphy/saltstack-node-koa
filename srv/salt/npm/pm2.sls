npm install -g pm2:
  cmd.run:
    - unless: test -e /usr/bin/pm2
    - require:
      - pkg: npm
