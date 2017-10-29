# Cheat Sheet: systemd
| Systemd is the new way, to start and maintain your system.

Show some Systemd Stats (Time)

```
systemd-analyze [critical-chain|blame]
```
## commands

control systemd units - see [systemctl](./systemctl.md)

```
systemctl
```

control the journal - see [journalctl](./journalctl.md)

```
journalctl
```

control hostname

```
hostnamectl
```

control / monitor dbus

```
busctl [monitor]
```

control date and time

```
timedatectl
```

control language or keyboardlayout

```
localectl
```

control login

```
loginctl
```

control Virtual Machine

```
machinectl
```

## paths

Path for unit-files
```
/usr/lib/systemd/system/
```

Config Path

```
/etc/systemd/system
```

Drop In Configs

```
/etc/systemd/system/<unitfile>.d/*.conf
```
