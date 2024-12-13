# Tux dev

## Run

```
$ podman run -it --rm tuxdev:2024.12.13 /bin/bash
```

## Build

```
# Please check your Dockerfile
$ podman run --rm -i docker.io/hadolint/hadolint < Dockerfile

$ podman build -t tuxdev:$(date +%Y.%m.%d) -f Dockerfile
```
