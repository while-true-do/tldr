# Cheat Sheet: rpm-ostree

| [rpm-ostree](https://rpm-ostree.readthedocs.io/en/latest/) is the ostree
manager for [Fedora Silverblue](https://silverblue.fedoraproject.org/) and
[Fedora IOT](https://iot.fedoraproject.org/).

## Information

Get help.

```
rpm-ostree --help
```

Get system status.

```
rpm-ostree status
```

## Install packages (layered packages)

Install a package.

```
rpm-ostree install <package>
```

Uninstall a package.

```
rpm-ostree uninstall <package>
```

## Update the system

Check for updates.

```
rpm-ostree upgrade --check
```

Update the system.

```
rpm-ostree upgrade
```

## Rollback

Rollback to the previous deployment.

```
rpm-ostree rollback
```

Switch to a specific commit.

```
rpm-ostree deploy <commit>
# or
rpm-ostree deploy <version string>
```

## Removal

Remove the previous deployment after rolling back.

```
rpm-ostree cleanup --rollback
```
