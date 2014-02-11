/src/koa:
  file.directory:
    - makedirs: True

https://github.com/mrDarcyMurphy/hello-koa.git:
  git.latest:
    - rev: master
    - target: /src/hello-koa

npm install --production:
  cmd.run:
    - cwd: /src/hello-koa
    - require:
      - pkg: npm

pm2 start processes.json:
  cmd.run:
    - cwd: /src/hello-koa
    - unless: test ! -e /usr/bin/pm2
