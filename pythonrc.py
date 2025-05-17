import atexit
import os
import sys
import asyncio
import json
import readline
import pathlib

histfile = os.path.join(os.path.expanduser("~/.cache/python"), ".python_history")

try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(10000)
except FileNotFoundError:
    pass
except OSError:
    pass

atexit.register(readline.write_history_file, histfile)

autoload_pkg = [
    "os",
    "sys",
    "asyncio",
    "json",
    "pathlib",
]

print("Autoloaded {pkg_list}".format(pkg_list=[x for x in autoload_pkg]))
