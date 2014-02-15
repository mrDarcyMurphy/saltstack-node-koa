/src/hello-koa:
  file.directory:
    - user: mercury
    - group: mercury
    - makedirs: True
    - recurse:
      - user
      - group

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
  cmd.run:
    - cwd: /src/hello-koa
    - user: mercury
    - watch:
      - git: https://github.com/mrDarcyMurphy/hello-koa.git
