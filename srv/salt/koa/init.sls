https://github.com/mrDarcyMurphy/hello-koa.git:
  git.latest:
    - rev: master
    - target: /src/hello-koa

/src/hello-koa/pids:
  file.directory:
    - makedirs: True

/src/hello-koa/logs:
  file.directory:
    - makedirs: True

npm install --production:
  cmd.wait:
    - cwd: /src/hello-koa
    - require:
      - pkg: npm
