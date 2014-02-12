/src/hello-koa:
  file.directory:
    - user: mercury
    - makedirs: True

https://github.com/mrDarcyMurphy/hello-koa.git:
  git.latest:
    - user: mercury
    - rev: master
    - target: /src/hello-koa

/src/hello-koa/pids:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group

/src/hello-koa/logs:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group

npm install --production:
  cmd.wait:
    - cwd: /src/hello-koa
    - user: mercury
    - require:
      - pkg: npm
    - watch:
      - git: https://github.com/mrDarcyMurphy/hello-koa.git
