# Cheat Sheet: docker

| [docker](https://www.docker.com/) is a container engine and cli tool to interact with the engine.

## Installation

In most distribution, you can install it straight from the repositories.


### Debian/Ubuntu

```
sudo apt-get update && sudo apt-get install docker
```

### Redhat/CentOS/Fedora

If you are using the good ol' yum.

```
sudo yum install docker
```

If you are using the new dnf.

```
sudo dnf install docker
```

### OpenSuSE/SLES

```
sudo zypper ref && sudo zypper install docker
```

### Arch Linux

```
sudo pacman -S docker
```

## Configuration

It is a good idea to add a docker group and add yourself to it.

```
sudo groupadd docker
sudo usermod -aG docker <user>
```

Furthermore, you want to start and enable the docker service.

```
# systemd
systemctl enable --now docker
```
### Official

If you want to use the official guide, the installation will be a little bit
different.

<https://docs.docker.com/install/overview/>

## Getting help

General help

```
docker --help
```

Help for a specific command

```
docker <command> --help
```

## Image Management

### Information

List images.

```
docker images
```

### Registry Interaction

Search the registry for an image.

```
docker search <string>
```

Pull an image from the docker-hub or other registry.
Updating works the same way.

```
docker pull <IMAGE>[:<TAG>]
```

### Removal

Remove an image.

```
docker rmi <IMAGE>[:<TAG>]
docker rmi <IMAGE ID>
```

You can also force this and remove linked containers.

```
docker rmi --force <IMAGE>[:<TAG>]
docker rmi --force <IMAGE ID>
```

### Creation

Build an image from a Dockerfile.

```
docker build <path>
```

## Container Management

### Information

Show running containers.

```
docker ps
```

Show all containers, also not running.

```
docker ps -a
```

Show detailed information for a container.

```
docker inspect <NAME>
docker inspect <CONTAINER ID>
```

Show logs from a container.

```
docker logs <NAME>
docker logs <CONTAINER ID>
```

Get events from a container.

```
docker events <NAME>
docker events <CONTAINER ID>
```

Show statistics from a container.

```
docker stats <NAME>
docker stats <CONTAINER ID>
```

Show running processes in a container.

```
docker top <NAME>
docker top <CONTAINER ID>
```

### Creation

Create a container, without starting it.

```
docker create <IMAGE>[:<TAG>]
# Add a name
docker create --name <NAME> <IMAGE>[:<TAG>]
# Add a command, to run
docker create <IMAGE>[:<TAG>] <command>
```

Create a container and starting it immediately.

```
docker run <IMAGE>[:<TAG>]
# Add a name
docker run --name <NAME> <IMAGE>[:<TAG>]
# Add a command, to run
docker run <IMAGE>[:<TAG>] <command>
```

### Start and Stop

Start an existing container.

```
docker start <NAME>
docker start <CONTAINER ID>
```

Stop a running container.

```
docker stop <NAME>
docker stop <CONTAINER ID>
```

Restart a container.

```
docker restart <NAME>
docker restart <CONTAINER ID>
```

Pause and Unpause (Freeze)

```
docker pause <NAME>
docker unpause <NAME>
```

### Interacting

Connect to running container.

```
docker attach <NAME>
docker attach <CONTAINER ID>
```

Execute a command in the container.

```
docker exec <NAME> <command>
docker exec <CONTAINER ID> <command>
```

Rename a container.

```
docker rename <old NAME> <new NAME>
docker rename <CONTAINER ID> <new NAME>
```

### Removal

Remove a Container, if it is stopped.

```
docker rm <NAME>
docker rm <CONTAINER ID>
```
