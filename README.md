# windows_tableau

#### How to use

Setup from remote url. Tableau official download site/
```puppet
  class {'windows_tableau':
    ensure => 'present',
    type => 'remote',
    from => 'https://downloads.tableausoftware.com/tssoftware/TableauServer-64bit.exe'
  }
````

Setup from puppet server
```puppet
  class {'windows_tableau':
    ensure => 'present',
      type => 'local',
      from => 'TableauServer-64bit.exe'
  }
```
#### Limitations

If you are going to download Tableau with puppet from remote server, make sure that it will be fast enough. Puppet download known to be fussy about timeout. I'v made changes there but pull request is still pending https://github.com/opentable/puppet-download_file/pull/17