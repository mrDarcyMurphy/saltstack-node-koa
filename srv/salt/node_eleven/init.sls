nodejs-dependencies:
  pkg.installed:
    - names:
      - python-software-properties
      - python
      - build-essential
      - g++
      - make

add-nodejs-devel-repo:
  cmd.run:
    - names:
      - sudo add-apt-repository -y ppa:chris-lea/node.js-devel
      - sudo apt-get update

install-nodejs:
  cmd.wait:
    - name: sudo apt-get install -y nodejs
    - watch:
      - cmd: add-nodejs-devel-repo
