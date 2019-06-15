# Cheat Sheet: Ansible

[Ansible](https://www.ansible.com) is an automation tool made simple.

## Installation

### pip (distribution unspecific)

```
virtualenv <env-name>
source <env-name>/bin/activate
pip install ansible
```

### Debian/Ubuntu

```
sudo apt-get update && sudo apt-get install ansible
```

### CentOS/RedHat/Fedora

If you are using the good ol' yum.
```
sudo yum install dnf dnf-plugins-core
```
If you are using the new dnf.
```
sudo dnf install ansible
```

### OpenSuSE/SLES

```
sudo zypper ref && sudo zypper in ansible
```

### Arch Linux

```
sudo pacman -S ansible
```

## ansible

For ansible ad-hoc commands you will need an inventory file. If you haven't set up one, please read [here](http://docs.ansible.com/ansible/latest/intro_inventory.html)

Reboot a server
```
ansible <server> -a "/sbin/reboot"
```

Gather information from a server
```
ansible <server> -m setup
```

Copy a file
```
ansible <server> -m copy -a "src=/etc/hosts dest=/tmp/hosts"
```

## ansible-galaxy

You can find the offical galaxy [here](https://galaxy.ansible.com), including the [while-true-do](https://galaxy.ansible.com/while-true-do/).

Initialize a new role directory
```
ansible-galaxy init <new-role>
```

Install from a requirements.yml
```
ansible-galaxy install -r requirements.yml
```

Install a role from galaxy.ansible.com
```
ansible-galaxy install <user.rolename>
```

## ansible-playbook

You can find an example [here](https://github.com/while-true-do/ansible-playbook-example).

Run a playbook with a given inventory
```
ansible-playbook -i inventory/servers servers.yml
```

Limit the Run to a group of servers
```
ansible-playbook -K -i inventory/servers servers.yml --limit webservers
```

Limit the run to some tags
```
ansible-playbook -K -i inventory/servers servers.yml --tags configuration
```
