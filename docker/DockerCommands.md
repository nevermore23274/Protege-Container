# Podman Build on Linux System
- Build, from root directory:
```
podman build --network=host -f ./docker/Dockerfile -t protege:latest .
```

- Container run:
```
podman run --rm -it --net=host -e DISPLAY=$DISPLAY -v /local/path:/container/path --name protege_container protege:latest
```

- System cleanup:
```
podman system prun -af
```
