class windows_tableau (
  $ensure   = 'enabled'
){
  case $ensure {
    'enabled', 'present': {
      if $osfamily == 'windows' {
        File { source_permissions => ignore }
        $tablue_path = "C:\Users\Administrator\Desktop\TableauServer-64bit.exe"
        exec { 'Setup Tableau':
          command => "${tablue_path} /verysilent",
          alias => 'tableau-setup',
          # extended timeout cause Tableau is SLOW!
          timeout => 90000
        }
      }
    }
    default: {
      fail("Invalid ensure option!\n")
    }
  }
}
