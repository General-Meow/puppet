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
include 'google_chrome'

class { 'ssh::server':
  storeconfigs_enabled => false,
  options => {
    'Match User paul' => {
      'ChrootDirectory' => '%h',
      'ForceCommand' => 'internal-sftp',
      'PasswordAuthentication' => 'yes',
      'AllowTcpForwarding' => 'yes',
      'X11Forwarding' => 'yes',
    },
    'PasswordAuthentication' => 'yes',
    'PermitRootLogin'        => 'no',
    'Port'                   => [22],
  },
}
