#!/usr/bin/python3
from pathlib import Path


def merge_py_module(path):
    for path in path.glob("*.py"):
        dirpath = path.with_suffix("")
        dirpath_init = dirpath / "__init__.py"
        if dirpath.is_dir() and dirpath_init.exists():
            dirpath_init.write_bytes(path.read_bytes())
            path.unlink()


def main(p):
    merge_py_module(p)
    for path in p.iterdir():
        if path.is_dir():
            main(path)


if __name__ == "__main__":
    import sys

    main(Path(sys.argv[1]))
