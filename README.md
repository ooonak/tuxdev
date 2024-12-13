# Tux dev

## Run

```
$ podman run -it --rm tuxdev:latest /bin/bash
```

## Build

```
# Please check your Dockerfile
$ podman run --rm -i docker.io/hadolint/hadolint < Dockerfile

$ podman build -t tuxdev:latest -f Dockerfile
```
