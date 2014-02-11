{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '0.11.11') -%}
{% set checksum = node.get('checksum', '1e330b4fbb6f7bb858a0b37d8573dd4956f40885') -%}
{% set make_jobs = node.get('make_jobs', '1') -%}

build-dependencies:
  pkg.installed:
    - names:
      - libssl-dev
      - pkg-config
      - build-essential
      - curl
      - gcc
      - g++
      - checkinstall


## Get Node
get-node:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source:  salt://node_eleven/node-v{{ version }}.tar.gz
    - require:
      - pkg: build-dependencies

unpack-node:
  cmd.wait:
    - cwd: /usr/src
    - names:
      - tar -zxvf node-v{{ version }}.tar.gz
    - watch:
      - file: /usr/src/node-v{{ version }}.tar.gz

make-node:
  cmd.wait:
    - cwd: /usr/src/node-v{{ version }}
    - names:
      - './configure'
      - 'make --jobs={{ make_jobs }}'
      - 'checkinstall --install=yes --pkgname=nodejs --pkgversion "{{ version }}" --default'
    - watch:
      - cmd: unpack-node
