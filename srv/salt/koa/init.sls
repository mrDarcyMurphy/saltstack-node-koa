/src/koa:
  file.directory:
    - makedirs: True

https://github.com/mrDarcyMurphy/hello-koa.git:
  git.latest:
    - rev: master
    - target: /src/hello-koa

set-port:
  cmd.run:
    - name: export PORT='80'
    - cwd: /src/hello-koa

node --harmony index.js:
  cmd.run:
    - cwd: /src/hello-koa
    - watch:
      - cmd: set-port