class windows_tableau (
  $ensure   = 'enabled',
  $type = undef,
  $from = undef,
  $version = undef,
  $trusted_host = undef
){
  case $ensure {
    'enabled', 'present': {
      if $osfamily == 'windows' {
        File { source_permissions => ignore }
        if $type == 'local'{
          $tablue_path = "C:\\Users\\Administrator\\Desktop\\TableauServer-64bit.exe"
          file { 'c:\\ProgramData\\tableau.exe':
            ensure  => file,
            source_permissions => ignore,
            source  => "puppet:///${from}"
          }
        }
        if $type == 'remote'{
          download_file { "Download Tableau" :
            url => $from,
            destination_directory => 'c:\\ProgramData',
            destination_file => 'tableau.exe',
            timeout => 90000
          }
          $tablue_path = "C:\Users\Administrator\Desktop\TableauServer-64bit1.exe"
        }
        exec { 'Setup Tableau':
          command => "${tablue_path} /verysilent",
          alias => 'tableau-setup',
          creates => 'C:\Program Files\Tableau\Tableau Server\unins000.dat',
          provider => powershell,
          # extended timeout cause Tableau is SLOW!
          timeout => 90000
        }->
        exec { 'perform Tableau Setup':
          command  => template('windows_tableau/initial_setup.ps1.erb'),
          creates => 'C:\Program Files\Tableau\Tableau Server\initial_setup.flg',
          provider => 'powershell',
          timeout => 600
        }->
        file { 'C:\\Program Files\\Tableau\\Tableau Server\\initial_setup.flg':
          ensure  => file,
          source_permissions => ignore
        }
      }
    }
    default: {
      fail("Invalid ensure option!\n")
    }
  }
}
