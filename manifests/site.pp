class{ 'java':
  repository            => 'webupd8team',
  distribution          => 'oracle',
  release               => 'java8',
  accept_oracle_license => true,
}

class { 'gradle':
  version => '1.8',
}

class { 'ohmyzsh': }
ohmyzsh::install { 'acme': }

