# windows_tableau

Simple way to install Tableau Server on target system.

#### Available options
- `version` - You must define Tableau Server version(short format). During setup this will used to locate proper tabadmin
- `trusted_host` - Used to setup `wgserver.trusted_hosts` and open correspondent TCP rule in windows firewall.
- `type` - Installation type. Possible options: `local` or `remote`. Based on this puppet will download TablueServer installer from url or from puppet server.
- `from` - URL or filename from puppet server

#### How to use

Setup from puppet server

```puppet
  class {'windows_tableau':
    ensure        =>  'present',
    version       =>  '8.3',
    trusted_host  =>  '192.168.1.1',
    from          =>  'TableauServer-64bit.exe'
  }
```
#### What if I need to make additional setup in Tableau?
Not a problem! You are free to edit `templates/initial_setup.ps1.erb` and add your additions.

- How to use `tabcmd` http://onlinehelp.tableausoftware.com/current/server/en-us/tabcmd_cmd.htm
- How to use `tabadmin` http://onlinehelp.tableausoftware.com/current/server/en-us/tabadmin_cmd.htm

#### Limitations

Nope.