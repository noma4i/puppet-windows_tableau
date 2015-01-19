class windows_tableau (
){
 case $ensure {
  'present': {
    exec { 'Setup Tableau':
      command => 'PS C:\Users\Administrator\Desktop\TableauServer-64bit.exe /verysilent',
    }
 }
}
