start-koa:
  cmd.run:
    - cwd: /src/hello-koa
    - user: mercury
    - name: pm2 start processes.json
    - unless: pm2 list | grep hello-koa
    - require:
      - pkg: nodejs

restart-koa:
  cmd.run:
    - cwd: /src/hello-koa
    - user: mercury
    - name: pm2 restart processes.json
    - onlyif: pm2 list | grep hello-koa
    - require:
      - pkg: nodejs
