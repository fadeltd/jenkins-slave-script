# Jenkins Slave Script

This script is a bash (Unix Executable) script for running jenkins slave with auto restart.

## Getting Started

First, you need to put the value on `config.properties`,
You can get the values from your jenkins server after creating a new node like this http://localhost:8080/computer/slave-node

You need to copy these values to the `config.properties` file

- jnlpUrl
- secret
- workDir

To start the script, you can just run

```sh
./slave
```

If the process is broken or something (like no internet connection) it will automatically try to restart the process.

## Start as Service

### Mac OS

You can use this script as a service, so it will automatically start on startup. To do that, you need to follow these instructions:

- Replace the `path/to` in `<string>` after the `Program` key with your slave directory. For example `Users/administrator/` if you put the script on root directory
- Copy the plist file `com.jenkins.slave.plist` in `~/Library/LaunchAgents/`
- Then you can start the script with this command

```sh
launchctl load ~/Library/LaunchAgents/com.jenkins.slave.plist
```

#### Testing the script

- To test if the script is running, you can log out and log in
- To test directly, run

```sh
launchctl start com.jenkins.slave
```

#### Reading error messages

You can read the error message with tail command

```sh
tail /var/log/system.log
```

The key is that this is a user-specific launchd entry, so it will be run on login for the given user.
System-specific launch daemons (placed in `/Library/LaunchDaemons`) are run on boot.

## Contribute

Contributions are welcome!

## TODO

- Windows Support
- Linux Support

## License

MIT
