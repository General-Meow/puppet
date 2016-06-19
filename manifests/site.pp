#Main manifest for this site
#To apply this manifest run: sudo puppet apply site.pp

#node '<nodename>' {
#	include bootstrap
#}

#run custom boot strap 
class { 'bootstrap':
	username => 'paul',
	group => 'sudo',
}


file { '/home/paul/.ssh/authorized_keys' :
  ensure  => 'present',
  source  => '/home/paul/.ssh/id_rsa.pub',
}
~>
ssh_keygen { 'paul':
  comment => 'pauls key',
  type => 'rsa',
  bits => '4096',
  filename => '/home/paul/.ssh/id_rsa'
}
