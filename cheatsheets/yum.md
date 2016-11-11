# yum (centOS, Redhat, Fedora) Cheat Sheet

| Yum is the common package manager in centOS, Redhat and Fedora <23.

## Using dnf

dnf is the new Tool in Fedora 23+ and you can load it in centOS/Redhat 7+. You can have a look at dnf [here](./dnf.md).

```
yum install dnf dnf-plugins-core
```

## Getting Help

List the available global options and commands

```
yum help
```

## Repository Management

Display enabled software repositories

```
yum repolist
```

Get information about a repository

```
yum repoinfo <repo-name>
```

Use a specific repository

```
yum repo-pkgs <repo-name> <operation>
# Install from a specific repository
yum repo-pkgs <repo-name> install <package-name>
```

Update the repository cache

```
yum makecache
```

## Package Management

Install a package

```
yum install <package-name>
```

Install a group

```
yum groupinstall <group-name>
```

Install a package from a localfile or ftp/http source

```
yum localinstall <path-to-rpm-file>
```

Reinstall a package in its current version

```
yum reinstall <package-name>
```

Remove a package and install another instead

```
yum swap <old-package-name> <new-package-name>
```

Remove/Erase a package

```
yum remove <package-name>
yum erase <package-name>
```

Remove a package including unneeded packages

```
yum autoremove <package-name>
```

## Update Management

Get information about possible updates

```
yum updateinfo
# Only for security updates
yum updateinfo security
```

Check repositories for available updates

```
yum check-update
```

Updating packages

```
# Update all packages
yum update
# Update a specific package
yum update <package-name>
# Apply security updates, only
yum update --security
```

Update to a specific version

```
yum update-to <package-name-with-version>
```

Upgrade, taking obsoletes in account

```
yum upgrade
```

Downgrade a package
```
yum downgrade <package-name>
```

## Querying

Search repositories for a package
```
yum search <string>
```

List packages from repositories

```
yum list
# List all available packages
yum list available
# List all installed packages
yum list installed
# List available and installed kernel packages
yum list kernel
```

Display information about a package

```
yum info <package-name>
```

Display dependencies for a package

```
yum deplist <package-name>
```

Find package that provides queried package

```
yum provides <path-to-file>
```

List installed and available package groups

```
yum grouplist
```

Display content and description of package group

```
yum groupinfo "<Group Name>"
```

## Locks / Pinning

To use version locking you need a yum-plugin first

```
yum install yum-plugin-versionlock
```

Now you can lock

```
yum versionlock <package-name>
```

## Utilities

Check the local rpm database

```
yum check
```

View and use yum transactions

```
# View the history
yum history list
# Show details of a transaction
yum history info <number>
# Undo a transaction
yum history undo <number>
# Redo a transaction
yum history redo <number>
```

Clean cached package data
```
yum clean packages
yum clean all
```
