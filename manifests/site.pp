#Main manifest for this site
#To apply this manifest run: sudo puppet apply site.pp

#node '<nodename>' {
#	include bootstrap
#}

#run custom boot strap 
class { 'bootstrap':
	username => 'anotheruserhere',
	group => 'sudo',
}

