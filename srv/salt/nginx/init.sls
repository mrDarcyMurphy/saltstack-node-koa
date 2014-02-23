nginx:
  pkg.installed:
    - names:
      - nginx
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/sites-available/saltykoa
      - file: /etc/nginx/sites-enabled/saltykoa

/etc/nginx/sites-available/saltykoa:
  file.managed:
    - source: salt://nginx/sites-available/saltykoa
    - user: root
    - group: root

/etc/nginx/sites-enabled/saltykoa:
  file.symlink:
    - target: /etc/nginx/sites-available/saltykoa
