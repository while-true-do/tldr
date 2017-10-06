# User and groups - Cheat Sheet

| Some help to create / edit / manipulate local users.

## Creation

### Useradd

Add a new user
```
useradd <username>
```

Add a new system user
```
useradd --system <username>
```

### Groupadd

Add a new group
```
groupadd <groupname>
```

Add a new system group
```
groupadd --system <groupname>
```

## Editing / Manipulation

Edit user password
```
passwd <username>
```

Edit user shell
```
chsh -s <shell>
```

## Deletion

Delete a user
```
userdel <username>
# Remove including related /home and mail queue
userdel --remove <username>
```

Delete a group
```
groupdel <groupname>
```
