# Cheat Sheet: virt-install

virt-install is used to build and install new VMs.

## Installation

You have to install *virt-install*.

### Debian/Ubuntu

```
sudo apt-get update && sudo apt-get install virt-install
```

### Redhat/CentOS/Fedora

If you are using the good ol' yum.

```
sudo yum install virt-install
```

If you are using the new dnf.

```
sudo dnf install virt-install
```

### OpenSuSE/SLES

```
sudo zypper ref && sudo zypper install virt-install
```

### Arch Linux

```
sudo pacman -S virt-install
```

## Creating VMs

Virt-install is a little bit more complicated. Therefore I will only provide a pattern for some typical use cases.

```
virt-install \
  --name <name> \
  --memory <RAM in MB> \
  --vcpus <CPU Cores> \
  --os-type <mostly linux> \
  --os-variant <variant name> \
  --disk size=<Disk Size in GB> \
  --network <name of network> \
  --location <location of ISO or Repository> \
  --extra-args="<additoonal kernal parameter for the installer>"
```

For the `--extra-args` you can use kickstart configurations for example. YOu can find additional information for kickstart in [this repository](https://github.com/while-true-do/kickstart).
