# Protoc for python3

In Linux/Windows subsystem for Linux:

```bash
#!/bin/sh

case $(uname -r) in
	*-Microsoft ) cwd=$(pwd);cwd=${cwd#/mnt};;
	* ) cwd=$(pwd);;
esac

docker run --rm -v "$cwd":/src ghcr.io/docker-s-images/protoc:main $*
```
