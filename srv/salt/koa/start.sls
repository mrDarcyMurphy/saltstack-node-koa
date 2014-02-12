# start the app
# pm2 is smart enough to not start the process again
# so I don't need an `unless`
# which is great because salt hangs on it.
start-koa:
  cmd.run:
    - cwd: /src/hello-koa
    - user: mercury
    - name: pm2 restart processes.json
