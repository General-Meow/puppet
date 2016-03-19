#Run a system update
class bootstrap::system_update {

	exec { 'apt-get update':
		command => '/usr/bin/apt-get update',
	}

}
