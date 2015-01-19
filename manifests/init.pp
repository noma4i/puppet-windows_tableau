class windows_tableau (
  $ensure   = 'enabled'
){
  case $ensure {
    'enabled', 'present': {
      exec { 'Setup Tableau':
        command => 'C:\Users\Administrator\Desktop\TableauServer-64bit.exe /verysilent',
      }
    }
    default: {
      fail("Invalid ensure option!\n")
    }
  }
}
