include:
  - nodejs.pm2

/src/hello-koa:
  file.directory:
    - user: mercury
    - group: mercury
    - makedirs: True
    - recurse:
      - user
      - group

hello-koa:
  git.latest:
    - name: https://github.com/mrDarcyMurphy/hello-koa.git
    - target: /src/hello-koa
    - rev: master
    - user: mercury
    - group: mercury
  cmd.wait:
    - name: npm install --production
    - cwd: /src/hello-koa
    - user: mercury
    - watch:
      - git: hello-koa

/src/hello-koa/pids:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group
    - require:
      - git: hello-koa

/src/hello-koa/logs:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group
    - require:
      - git: hello-koa


# Not sure yet if I should make these part of highstate or not
start-koa:
  cmd.run:
    - name: DEBIAN_FRONTEND=noninteractive pm2 start processes.json
    - cwd: /src/hello-koa
    - user: mercury
    - shell: /bin/bash
    - onlyif: test -e /home/mercury/bin/pm2
    - require:
      - git: hello-koa
      - cmd: pm2-install

# restart-koa:
#   cmd.run:
#     - name: pm2 -s restart processes.json
#     - cwd: /src/hello-koa
#     - user: mercury
#     - shell: /bin/bash
#     - timeout: 10
#     - require:
#       - pkg: nodejs
#       - git: hello-koa
