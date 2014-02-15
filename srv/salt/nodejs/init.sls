include:
  - ppa

nodejs-add-ppa:
  pkgrepo.managed:
    - name: nodejs
    - ppa: chris-lea/node.js-devel
    - require_in:
      - pkg: nodejs-install

nodejs-install:
  pkg.installed:
    - names:
      - nodejs
