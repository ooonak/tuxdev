# Tux dev

## Run

```
$ podman run -it --rm --userns=keep-id --device=/dev/kvm -v $HOME/tuxdev:/home/ubuntu/tuxdev:Z tuxdev:2024.12.15 /bin/bash
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

# Verify that everything is in place

## Yocto project

From inside the container.

```
$ cd yocto/poky
$ source oe-init-build-env
$ bitbake core-image-minimal

$ runqemu qemux86-64
```

## Buildroot project

From inside the container.

```
$ cd buildroot
$ make qemu_x86_64_defconfig
$ make -j$(nproc)

$ qemu-system-x86_64 -enable-kvm \
  -M pc \
  -kernel output/images/bzImage \
  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
  -append "root=/dev/vda console=ttyS0" \
  -net user,hostfwd=tcp:127.0.0.1:3333-:22 \
  -net nic,model=virtio \
  -nographic
```
