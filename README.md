# windows_tableau

Simple way to install Tableau Server on target system.

#### Available option
  `version` - You must define Tableau Server version(short format). During setup this will used to locate proper tabadmin
  `trusted_host` - Used to setup `wgserver.trusted_hosts` and open correspondent TCP rule in windows firewall.
  `type` - Installation type. Possible options: `local` or `remote`. Based on this puppet will download TablueServer installer from url or from puppet server.
  `from` - URL or filename from puppet server

#### How to use

Setup from remote url. Tableau official download site/
```puppet
  class {'windows_tableau':
    ensure        =>  'present',
    version       =>  '8.3',
    trusted_host  =>  '192.168.1.1',
    type          =>  'remote',
    from          =>  'https://downloads.tableausoftware.com/tssoftware/TableauServer-64bit.exe'
  }
````

Setup from puppet server
```puppet
  class {'windows_tableau':
    ensure        =>  'present',
    version       =>  '8.3',
    trusted_host  =>  '192.168.1.1',
    type          =>  'local',
    from          =>  'TableauServer-64bit.exe'
  }
```
#### Limitations

If you are going to download Tableau with puppet from remote server, make sure that it will be fast enough. Puppet download known to be fussy about timeout. I'v made changes there but pull request is still pending https://github.com/opentable/puppet-download_file/pull/17