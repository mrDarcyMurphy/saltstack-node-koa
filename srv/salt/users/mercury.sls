mercury:
  group:
    - present
  user.present:
    - fullname: Quicksilver
    - password: $6$0uLO0Crx$.06aWT4buHhHroTtaVcHcT85wuKzwGjrjh5BCtJJkiMqIAEpDXu9.yaexsh9crmELpzGkJHpeYIkSco0lpj.U0
    - home: /home/mercury
    - shell: /bin/bash
    - groups:
      - sudo
      - staff

# this directory is linked, otherwise it'd be chowned as well.
# /etc/salt:
#   file.directory:
#   - user: mercury
#   - group: mercury
#   - recurse:
#     - user
#     - group

/var/cache/salt:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group

/var/log/salt:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group

# this is the directory for the app
/usr/src:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group

# pm2 options
/home/mercury/.pm2:
  file.directory:
    - user: mercury
    - group: mercury
    - recurse:
      - user
      - group
