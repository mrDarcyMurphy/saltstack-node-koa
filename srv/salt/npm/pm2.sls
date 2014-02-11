# install pm2 via npm
npm install -g pm2:
  cmd.run:
    - unless: test -e /usr/local/bin/pm2
    - require:
      - pkg: npm

pm2-custom-options:
  file.managed:
    - name: /root/.pm2/custom_options.sh
    - source:  salt://npm/pm2/custom_options.sh
