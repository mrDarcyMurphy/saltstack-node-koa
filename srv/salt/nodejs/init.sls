# include:
#   - ppa

# nodejs-add-ppa:
#   pkgrepo.managed:
#     - name: nodejs
#     - ppa: chris-lea/node.js-devel
#     - require_in:
#       - pkg: nodejs-install

# nodejs-install:
#   pkg.installed:
#     - names:
#       - nodejs

{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '0.11.11') -%}
{% set checksum = node.get('checksum', '1e330b4fbb6f7bb858a0b37d8573dd4956f40885') -%}
{% set make_jobs = node.get('make_jobs', '1') -%}


# Most dependencies are already in the build state
nodejs-build-dependencies:
  pkg.installed:
    - names:
      - libssl-dev

# use the source, luke.
nodejs-tar:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source:  salt://nodejs/node-v{{ version }}.tar.gz
    - user: mercury
    - group: mercury
    - require:
      - pkg: nodejs-build-dependencies

nodejs-unpack:
  cmd.run:
    - cwd: /usr/src
    - user: mercury
    - names:
      - tar -zxvf node-v{{ version }}.tar.gz
    - watch:
      - file: nodejs-tar
    - unless: test -e /usr/src/node-v{{ version }}

# build it, they will come
nodejs-make:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - user: mercury
    - names:
      - './configure --prefix=/home/mercury'
      - 'make --jobs={{ make_jobs }}'
      - 'DEBIAN_FRONTEND=noninteractive checkinstall --install=yes --pkgname=nodejs --pkgversion "{{ version }}" --default'
    - unless: test -e /home/mercury/bin/node
    - watch:
      - cmd: nodejs-unpack
