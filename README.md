# Kronisk

Runs a command quietly unless it fails: a Python implementation of the chronic(1) cron tool

## Requirements

* `python>=3.5`

Compiling the manpage from scratch requires

* `scdoc`

Using `Makefile` to install everything requires

* `make`
* `install`
* `gzip`

## Install

Install scripts to `/usr/local/bin` and manpages to `/usr/local/share/man/man1`:

```sh
$ sudo make install
```

Install scripts to `$PREFIX/bin` and manpages to `$PREFIX/share/man/man1`:

```sh
$ sudo make PREFIX=/usr install  # /usr/bin etc.
```

— or simply copy everything manually:

```sh
$ sudo mkdir -p /usr/local/bin/              # make sure $BINDIR exists
$ sudo cp -fax src/kronisk /usr/local/bin/
$ sudo mkdir -p /usr/local/man/man1          # make sure $MANDIR exists
$ sudo cp -fax man/kronisk.1 /usr/local/man/man1/
```

ArchLinux users can use, e.g.:

```sh
$ yay -S kronisk
```

in order to install `kronisk` directly from AUR

⌘ https://aur.archlinux.org/packages/kronisk/

## Usage

```
Usage: kronisk [OPTIONS] COMMAND [ARG …]

positional arguments:
  COMMAND       command to run
  ARG           optional argument(s) for COMMAND

optional arguments:
  -h, --help    show this help message and exit
  --version     show version information and exit
  --copyright   show copying policy and exit
  -e, --stderr  Triggers output when standard error has nonzero length

Kronisk runs a command, and arranges for its standard output and error
to only be displayed if the command fails — i.e., exits nonzero or
crashes. If the command succeeds, any output will be hidden.

In case of a nonzero exit code, kronisk will print the command's output
and error to their respective channels, and exit with the return value
from the command.

The switch -e/--stderr triggers output when standard error output length
is nonzero. Without -e kronisk needs a nonzero return value to trigger
output. In this mode, kronisk's return value will be 2 if the command's
return value is 0 but the command printed something to standard error.
```

See `kronisk(1)` for details.
