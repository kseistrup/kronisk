# kronisk

Python implementation of the chronic(1) cron tool

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
is nonzero. Without -e kronisk needs a non-zero return value to trigger
output. In this mode, kronisk's return value will be 2 if the command's
return value is 0 but the command printed something to standard error.
```
