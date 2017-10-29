# Cheaht Sheet: zypper (SLE & opensuse) 

| Zypper is the common package manager in Opensuse and SuSE Linux Enterprise (SLES).

## Getting Help

List the available global options and commands

```
zypper help
```

Print help for a specific command

```
zypper help <command>
```

Open a zypper shell session

```
zypper shell
# or
zypper sh
```

## Repository Management

List defined Repositories

```
zypper repos
# or
zypper lr
```

Refresh the local repo cache

```
zypper refresh
# or
zypper ref
```

Adding Repositories

```
zypper addrepo <url> <alias>
# or
zypper ar <url> <alias>
```

Modify Repositories

```
zypper modifyrepo
# or
zypper mr
```

Rename Repositories

```
zypper namerepo <repository>
# or
zypper nr <repository>
```

Remove Repositories

```
zypper removerepo <repository>
# or
zypper rr <repository>
```

## Package Management

Install Package

```
zypper install <package>
# or
zypper in <package>
```

Remove Package

```
zypper remove <package>
# or
zypper rm <package>
```

## Update Management

Update Package

```
zypper update <package>
# or
zypper up <package>
# or use it like installing package
```

List needed patches

```
zypper list-patches
# or
zypper lp
```

List all patches

```
zypper patches
```

Check patches

```
zypper patch-check
# or
zypper patch-check
```

Apply patches

```
zypper patch
```

List Updates

```
zypper list-updates
# or
zypper lu
```

Apply Updates

```
zypper update
# or
zypper up
```

Distribution Upgrade

```
zypper dist-upgrade
# or
zypper dup
```

## Querying

Search the Repositories

```
zypper search <string>
# or
zypper se <string>
```

Information about a package

```
zypper info <package>
```

Information about dependencies

```
zypper what-provides <package>
# or
zypper wp <package>
```

## Locks / Pinning

List Locks

```
zypper locks
# or
zypper ll
```

Add Locks

```
zypper addlock
# or
zypper al
```

Remove Locks

```
zypper removelock
# or
zypper rl
```

## Utilities

Daemons, Tools or so that needs to be restartet after some operation

```
zypper ps
```

Verify dependencies

```
zypper verify
# or
zypper ve
```
