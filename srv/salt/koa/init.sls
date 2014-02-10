/src/koa:
  file.directory:
    - makedirs: True

https://github.com/mrDarcyMurphy/hello-koa.git:
  git.latest:
    - rev: master
    - target: /src/hello-koa

install-pm2:
  cmd.run:
    - name: npm install -g pm2
    - cwd: /src/hello-koa

install-dependencies:
  cmd.run:
    - name: npm install --production
    - cwd: /src/hello-koa

export PORT=80 && PM2_NODE_OPTIONS='--harmony' && pm2 start index.js --name hello-koa:
  cmd.run:
    - cwd: /src/hello-koa
