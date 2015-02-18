class windows_tableau (
  $ensure   = 'enabled',
  $from = undef,
  $version = undef,
  $trusted_host = undef
){
  case $ensure {
    'enabled', 'present': {
      File { source_permissions => ignore }
      file { 'c:\\ProgramData\\tableau.exe':
        ensure             => file,
        source_permissions => ignore,
        source             => "puppet:///${from}"
      }->
      exec { 'Setup Tableau':
        command => 'c:\\ProgramData\\tableau.exe /verysilent',
        alias   => 'tableau-setup',
        creates => 'C:\\Program Files\\Tableau\\Tableau Server\\unins000.dat',
        # extended timeout cause Tableau is SLOW!
        timeout => 600
      }->
      exec { 'perform Tableau Setup':
        command  => template('windows_tableau/initial_setup.ps1.erb'),
        creates  => 'C:\\Program Files\\Tableau\\Tableau Server\\initial_setup.flg',
        provider => 'powershell',
        timeout  => 600
      }->
      file { 'C:\\Program Files\\Tableau\\Tableau Server\\initial_setup.flg':
        ensure             => file,
        source_permissions => ignore
      }
    }
    default: {
      fail('Invalid ensure option!\n')
    }
  }
}
