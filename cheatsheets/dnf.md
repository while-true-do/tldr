# Cheat Sheet: DNF

 Dandified YUM [(DNF)](https://rpm-software-management.github.io/) is the next
 upcoming major version of YUM. It does package management using RPM, libsolv
 and hawkey libraries.

## Install dnf

In centOS/Redhat 7+, you have to install dnf. In Fedora 23+ it is preinstalled.

```
yum install dnf dnf-plugins-core
```

## Getting Help

Basically all commands are similar to [yum](./yum.md). You can have a look at a comparison in the behaviour [here](http://dnf.readthedocs.io/en/latest/cli_vs_yum.html).

List the available global options and commands

```
dnf help
```

## Repository Management

Display enabled software repositories

```
dnf repolist
```

Get information about a repository

```
dnf repoinfo <repo-name>
```

Use a specific repository

```
dnf repo-pkgs <repo-name> <operation>
# Install from a specific repository
dnf repo-pkgs <repo-name> install <package-name>
```

Update the repository cache

```
dnf makecache
```

## Package Management

Install a package

```
dnf install <package-name>
```

Install a group

```
dnf groupinstall <group-name>
```

Install a package from a localfile or ftp/http source

```
dnf localinstall <path-to-rpm-file>
```

Reinstall a package in its current version

```
dnf reinstall <package-name>
```

Remove a package and install another instead

```
dnf swap <old-package-name> <new-package-name>
```

Remove/Erase a package

```
dnf remove <package-name>
dnf erase <package-name>
```

Remove a package including unneeded packages

```
dnf autoremove <package-name>
```

## Update Management

Get information about possible updates

```
dnf updateinfo
# Only for security updates
dnf updateinfo security
```

Check repositories for available updates

```
dnf check-update
```

Updating packages

```
# Update all packages
dnf update
# Update a specific package
dnf update <package-name>
# Apply security updates, only
dnf update --security
```

Update to a specific version

```
dnf update-to <package-name-with-version>
```

Upgrade, taking obsoletes in account

```
dnf upgrade
```

Downgrade a package
```
dnf downgrade <package-name>
```

## Querying

Search repositories for a package
```
dnf search <string>
```

List packages from repositories

```
dnf list
# List all available packages
dnf list available
# List all installed packages
dnf list installed
# List available and installed kernel packages
dnf list kernel
```

Display information about a package

```
dnf info <package-name>
```

Display dependencies for a package

```
dnf deplist <package-name>
```

List installed and available package groups

```
dnf grouplist
```

Display content and description of package group

```
dnf groupinfo "<Group Name>"
```

## Locks / Pinning

To use version locking you need a dnf-plugin first

```
dnf install 'dnf-command(versionlock)'
```

Now you can lock

```
dnf versionlock <package-name>
```

## Utilities

Check the local rpm database

```
dnf check
```

View and use dnf transactions

```
# View the history
dnf history list
# Show details of a transaction
dnf history info <number>
# Undo a transaction
dnf history undo <number>
# Redo a transaction
dnf history redo <number>
```

Clean cached package data
```
dnf clean packages
dnf clean all
```
