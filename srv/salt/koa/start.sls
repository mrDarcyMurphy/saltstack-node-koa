include:
  - nodejs

start-koa:
  cmd.run:
    - name: pm2 start processes.json
    - cwd: /src/hello-koa
    - user: mercury
    - shell: /bin/bash
    # - timeout: 10
    - require:
      - pkg: nodejs

# restart-koa:
#   cmd.run:
#     - name: pm2 -s restart processes.json
#     - cwd: /src/hello-koa
#     - user: mercury
#     - shell: /bin/bash
#     - timeout: 10
#     - require:
#       - pkg: nodejs
