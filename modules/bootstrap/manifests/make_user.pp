define bootstrap::make_user(String $username, String $group) {

	user { "$username":
		name => "$username",
		ensure => 'present',
		home => "/home/$username",
		comment => "$username user created via the make_user defined type",
		expiry => 'absent',
		groups => "$group",
		managehome => 'yes', 
	}

}

#make_user { 'make another user':
#	username => 'hello',	
#	group => 'sudo'
#}
