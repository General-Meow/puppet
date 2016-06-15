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
#	theme => 'robbyrussell',	
	theme => 'ys',
}
ohmyzsh::plugins { 'paul':
	plugins => 'git github mercurial tmux docker',	
}
ohmyzsh::upgrade { 'paul': }

#class { "apache":
#	package => 'apache2',
#	ensure => 'present',
#}


class { "apache": }

include htop
include byobu
include google_chrome

#saz-ssh
include ssh::server
ssh::server::host_key {'ssh_host_rsa_key':
  private_key_source => 'file:///home/paul/.ssh/id_rsa',
  public_key_source  => 'file:///home/paul/.ssh/id_rsa.pub',
}

#class { 'docker' :
#  ensure => 'absent',
#}

