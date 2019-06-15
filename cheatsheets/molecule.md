# Cheat Sheet: molecule

[Molecule](https://molecule.readthedocs.io/)  is designed to aid in the
development and testing of [Ansible](https://www.ansible.com) roles.

## Installation

### pip (distribution unspecific)

```
virtualenv <env-name>
source <env-name>/bin/activate
pip install ansible molecule
```

## Getting Help

General help.

```
molecule --help
```

Help for a command.

```
molecule <command> --help
```

## Initialize

Initialize a new Ansible Role and a molecule scenario.

```
molecule init -r <role_name>
```

Initialize a new scenario in an existing Ansible Role.

```
molecule init -s <role_name>
```

## Testing

Lint the Ansible Role.

```
molecule lint
```

Run the full test scenario.

```
molecule test
```

Create the test environment.

```
molecule create
```

Run only the verification checks.

```
molecule verify
```

Execute the Ansible Role.

```
molecule converge
```
