# Cheat Sheet: virsh

| Virsh is the command line interface for libvirt.

## Installation

In most distributions it is installed with libvirt.

### Debian/Ubuntu

```
sudo apt-get update && sudo apt-get install libvirt
```

### Redhat/CentOS/Fedora

If you are using the good ol' yum.

```
sudo yum install libvirt
```

If you are using the new dnf.

```
sudo dnf install libvirt
```

### OpenSuSE/SLES

```
sudo zypper ref && sudo zypper install libvirt
```

### Arch Linux

```
sudo pacman -S libvirt
```

## Getting help

General help

```
virsh --help
```

Help for a specific command

```
virsh <command> --help
```

## Domain Management

### Information

Show running Domains / VMs

```
virsh list
```

Show all Domains / VMs

```
virsh list --all
```

### Starting

Start an existing domain

```
virsh start <domain>
```

### Stopping

Gracefully Shutdown a domain

```
virsh shutdown <domain>
```

Hard stop a domain

```
virsh destroy <domain>
```

### Rebooting

Gracefully Reboot a domain

```
virsh reboot <domain>
```

Hard reset a domain

```
virsh reset <domain>
```

### Manipulating

Edit a domain

```
virsh edit <domain>
```

Remove a domain (disk and logs must be deleted manually)

```
virsh undefine <domain>
```
