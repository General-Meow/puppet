#This is the main class for the bootstrap module. it must have the same class name as the module

class bootstrap(String $username, String $group) {

# -> left thing applies before right
# ~> left thing applies before right and right only happens if left makes a change

	include bootstrap::system_update		
	include bootstrap::system_dist_upgrade
	bootstrap::make_user { 'make the main user for this machine':
		username => "$username",
		group => "$group",
	}
	class { 'bootstrap::change_ssh':
		username => "$username",
	}	
}
