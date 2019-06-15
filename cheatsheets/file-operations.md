# Cheat Sheet: File Operations

Files and Directories Operations on local disks.

## Information

Show content of a file

```
cat <file>
less <file>
view <file>
```

Show mime type / file type

```
file <file>
```

## Creating

Create a file

```
touch <file>
```

Create a directory

```
mkdir <directory>
```

Create the full directory path

```
mkdir -p .../<directory>/<directory>/...
```

## Copy & Move

Copy a file

```
cp <source> <destination>
```

Copy recursive

```
cp -r <source> <destination>
```

Copy and keep permissions, timestamps (archive)

```
cp -a <source> <destinations>
```

Move a file / directory

```
mv <source> <destination>
```

## Removing

Remove a file

```
rm <file>
```

Remove forcefully recursive

```
rm -rf <path>
```

## Permissions

Change owner/group of a file/directory

```
chown <user>:<group> <path>
```

Change owner/group recursively

```
chown -R <owner>:<group> <path>
```

Change mode/permissions of a file/directory

```
chmod <SUGO> <path>
#
# Numeric Modes:
# S = Special
# U = User
# G = Group
# O = Others
#
# Examples:
# 0400 = read for user only
# 0600 = read+write for user only
# 0700 = read+write+exec user only
# 0644 = user can read+write, everybody can read only
```

## Finding

Finding a file or directory with a name

```
find . -iname "*<pattern>*"
```

## Linking

Create a symlink

```
ln -s <source> <link>
```
