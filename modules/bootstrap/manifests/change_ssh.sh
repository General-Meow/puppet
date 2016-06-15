class bootstrap::change_ssh (String $username) {

	file { "/home/$username/.ssh":
		ensure => 'directory',
		before => File['change-ssh.sh'],
		owner => "$username",
		group => "$username",
	}

	file { 'change-ssh.sh':
		ensure => 'present',
		path => "/home/$username/.ssh/change-ssh.sh",
		mode => '0700',
		owner => "$username",
		group => "$username",
		source => 'file:///etc/puppetlabs/code/environments/production/modules/bootstrap/files/change-ssh.sh',
	}

	file { 'add-path':
		ensure => 'present',
		content => "export PATH=\$PATH:/home/$username/.ssh",
		path => '/etc/profile.d/change-ssh.sh',
		require => File['change-ssh.sh'],
	}
}
