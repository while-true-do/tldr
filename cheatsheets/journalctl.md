# Cheat Sheet: journalctl

If you are using systemd, journalctl will be the command line tool, you need to
get log information.

Show Log

```
journalctl
```

Verify Log

```
journalctl --verify
```

less-like 1000 lines

```
journalctl -e
```

Follow the journal

```
journalctl -f
```

Show logs from a unit

```
journalctl -u <unit>
```

List boots

```
journalctl --list-boots
```

Logs from the last boot

```
journalctl -b -1
```
