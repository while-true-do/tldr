# Cheat Sheet: podman

| [podman](https://podman.io/) is library and tool to run OCI-based containers.

## Installation

In most distribution, you can install it straight from the repositories.

### Redhat/CentOS/Fedora

If you are using the good ol' yum.

```
sudo yum install podman
```

If you are using the new dnf.

```
sudo dnf install podman
```

## Configuration

It is a good idea to add a podman group and add yourself to it.

```
sudo groupadd podman
sudo usermod -aG podman <user>
```

Furthermore, you want to start and enable the podman service.

```
# systemd
systemctl enable --now podman
```
### Official

If you want to use the official guide, the installation will be a little bit
different.

<https://docs.podman.com/install/overview/>

## Getting help

General help

```
podman --help
```

Help for a specific command

```
podman <command> --help
```

## Image Management

### Information

List images.

```
podman images
```

### Registry Interaction

Search the registry for an image.

```
podman search <string>
```

Pull an image from the podman-hub or other registry.
Updating works the same way.

```
podman pull <IMAGE>[:<TAG>]
```

### Removal

Remove an image.

```
podman rmi <IMAGE>[:<TAG>]
podman rmi <IMAGE ID>
```

You can also force this and remove linked containers.

```
podman rmi --force <IMAGE>[:<TAG>]
podman rmi --force <IMAGE ID>
```

### Creation

Build an image from a podmanfile.

```
podman build <path>
```

## Container Management

### Information

Show running containers.

```
podman ps
```

Show all containers, also not running.

```
podman ps -a
```

Show detailed information for a container.

```
podman inspect <NAME>
podman inspect <CONTAINER ID>
```

Show logs from a container.

```
podman logs <NAME>
podman logs <CONTAINER ID>
```

Get events from a container.

```
podman events <NAME>
podman events <CONTAINER ID>
```

Show statistics from a container.

```
podman stats <NAME>
podman stats <CONTAINER ID>
```

Show running processes in a container.

```
podman top <NAME>
podman top <CONTAINER ID>
```

### Creation

Create a container, without starting it.

```
podman create <IMAGE>[:<TAG>]
# Add a name
podman create --name <NAME> <IMAGE>[:<TAG>]
# Add a command, to run
podman create <IMAGE>[:<TAG>] <command>
```

Create a container and starting it immediately.

```
podman run <IMAGE>[:<TAG>]
# Add a name
podman run --name <NAME> <IMAGE>[:<TAG>]
# Add a command, to run
podman run <IMAGE>[:<TAG>] <command>
```

### Start and Stop

Start an existing container.

```
podman start <NAME>
podman start <CONTAINER ID>
```

Stop a running container.

```
podman stop <NAME>
podman stop <CONTAINER ID>
```

Restart a container.

```
podman restart <NAME>
podman restart <CONTAINER ID>
```

Pause and Unpause (Freeze)

```
podman pause <NAME>
podman unpause <NAME>
```

### Interacting

Connect to running container.

```
podman attach <NAME>
podman attach <CONTAINER ID>
```

Execute a command in the container.

```
podman exec <NAME> <command>
podman exec <CONTAINER ID> <command>
```

Rename a container.

```
podman rename <old NAME> <new NAME>
podman rename <CONTAINER ID> <new NAME>
```

### Removal

Remove a Container, if it is stopped.

```
podman rm <NAME>
podman rm <CONTAINER ID>
```
