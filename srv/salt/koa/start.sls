# start the app
# pm2 is smart enough to not start the process again
# so I don't need an `unless`
# which is great because salt hangs on it.
pm2 start processes.json:
  cmd.run:
    - cwd: /src/hello-koa
