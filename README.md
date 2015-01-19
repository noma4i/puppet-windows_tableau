# windows_tableau

#### WIP

Setup from remote url. Tableau official download site/
`
  class {'windows_tableau':
    ensure => 'present',
    type => 'remote',
    from => 'https://downloads.tableausoftware.com/tssoftware/TableauServer-64bit.exe'
  }
`

Setup from puppet server
`
  class {'windows_tableau':
    ensure => 'present',
      type => 'local',
      from => 'TableauServer-64bit.exe'
  }
`
