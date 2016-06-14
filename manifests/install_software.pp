# JAVA
#class{ 'java':
#  repository            => 'webupd8team',
#  distribution          => 'oracle',
#  release               => 'java8',
#  accept_oracle_license => true,
#}

class { 'java' :
  package => 'openjdk-8-jdk',
}

#class { 'gradle':
#  version => '1.8',
#}

class { 'ohmyzsh': }
ohmyzsh::install { 'paul': }
ohmyzsh::theme { ['paul']: 
	theme => 'robbyrussell',	
}
ohmyzsh::plugins { 'paul':
	plugins => 'git github',	
}
ohmyzsh::upgrade { 'paul': }

#class { "apache":
#	package => 'apache2',
#	ensure => 'present',
#}


class { "apache": }

include htop
include byobu
