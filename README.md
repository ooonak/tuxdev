# Tux dev

## Run

```
$ podman run -it --rm --userns=keep-id --device=/dev/kvm -v $HOME/projects/debugging-labs:/home/ubuntu/debugging-labs:Z tuxdev:2024.12.13 /bin/bash
```

To be able to run qemu-kvm from inside the container both the user on the host and inside the container needs to be a member of the kvm group.

```
$ sudo usermod -aG kvm $USER
```

## Build

```
# Please check your Dockerfile
$ podman run --rm -i docker.io/hadolint/hadolint < Dockerfile

$ KVM_GID=$(getent group kvm | cut -d ':' -f 3)
$ podman build --build-arg KVM_GID=$KVM_GID -t tuxdev:$(date +%Y.%m.%d) -f Dockerfile
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