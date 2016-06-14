# puppet

files in the ../production directory where librarian installs itself to manage module.

the file thats really important here though is the ./manifest/site.pp

Requires: git & puppet boot strap

Usage:
- cd /etc/puppetlabs/code/environments/production
- sudo git init
- sudo git remote add origin https://github.com/General-Meow/puppet.git
- sudo git fetch origin master
- sudo git reset --hard origin/master
- sudo librarian-puppet update
- sudo puppet apply manifests/site.pp
