# puppet

files in the ../production directory where librarian installs itself to manage module.

the file thats really important here though is the ./manifest/site.pp

Requires: git & puppet boot strap

Usage:
- cd ~/.puppetlabs/code
- git init
- git remote add origin https://github.com/General-Meow/puppet.git
- git fetch origin master
- git reset --hard origin/master
- librarian-puppet update
- puppet apply manifests/site.pp
