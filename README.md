# Tux dev

## Run

```
$ podman run -it --rm --userns=keep-id -v $HOME/projects/debugging-labs:/home/ubuntu/debugging-labs:Z tuxdev:2024.12.13 /bin/bash
```

## Build

```
# Please check your Dockerfile
$ podman run --rm -i docker.io/hadolint/hadolint < Dockerfile

$ podman build -t tuxdev:$(date +%Y.%m.%d) -f Dockerfile
```

# Buildroot project

From inside the container.

```
$ cd debugging-labs/Buildroot
$ git checkout debugging-training/2024.02
$ make stm32mp157a_dk1_debugging_defconfig
$ make
```

 - https://bootlin.com/doc/training/debugging/debugging-labs.pdf