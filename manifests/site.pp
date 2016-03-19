#Main manifest for this site
#To apply this manifest run: sudo puppet apply site.pp

#node '<nodename>' {
#	include bootstrap
#}

#run custom boot strap 
class {'bootstrap':
	username => 'anotheruserhere',
	group => 'sudo',
}

#class{ 'java':
#  repository            => 'webupd8team',
#  distribution          => 'oracle',
#  release               => 'java8',
#  accept_oracle_license => true,
#}

#class { 'gradle':
#  version => '1.8',
#}

class { 'ohmyzsh': }
ohmyzsh::install { 'acme': }

#class { "apache": 
#	package => 'apache2',
#	ensure => 'present',
#}


class { "apache": }

include byobu
