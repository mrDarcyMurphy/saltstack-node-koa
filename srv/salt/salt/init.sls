# chown the things salt cares about so that we can run as an unprivileged user

# /etc/salt:
#   file.directory:
#   - user: mercury
#   - recurse:
#     - user

/var/cache/salt:
  file.directory:
  - user: mercury
  - recurse:
    - user

/var/log/salt:
  file.directory:
  - user: mercury
  - recurse:
    - user

/usr/src:
  file.directory:
  - user: mercury
  - recurse:
    - user
