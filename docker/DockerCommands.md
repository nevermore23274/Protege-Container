# Podman Build on Linux System
- Build, from root directory:
```
podman build --network=host -f ./docker/Dockerfile -t protege:latest .
```

- Container run:
```
podman run --rm -it --net=host -e DISPLAY=$DISPLAY -v /local/path:/root/protege/protege-desktop/target/protege-5.6.3-linux/Protege-5.6.3 --name protege_container protege:latest
```
** Note, this will mount your local storage location allowing you to easily utilize the files made. If you don't know what to put in the `/local/path` then do a `pwd` command so you can copy/paste it in.

- System cleanup:
```
podman system prune -af
```
