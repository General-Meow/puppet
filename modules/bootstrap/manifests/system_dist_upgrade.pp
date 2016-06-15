#upgrade the entire system
class bootstrap::system_dist_upgrade {
	
	exec { 'apt-get dist-upgrade':
		command => '/usr/bin/apt-get dist-upgrade -y',
		timeout => '1800', #30mins
	}
}
