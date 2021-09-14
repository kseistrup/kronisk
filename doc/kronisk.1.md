KRONISK(1)

# NAME

kronisk - runs a command quietly unless it fails

# SYNOPSIS

*kronisk* [_OPTIONS_] _COMMAND_ [_ARG_ …]

# OPTIONS

*-h*, *--help*
	Show a short help message and exit
*--version*
	Show version information and exit
*--copyright*
	Show copying policy and exit
*-e*, *--stderr*
	Triggers output when standard error has nonzero length

# DESCRIPTION

*Kronisk* runs _COMMAND_, and arranges for its standard output and error to
only be displayed if the command fails — i.e., exits nonzero or crashes. If
the command succeeds, any output will be hidden.

In case of a nonzero exit code, *kronisk* will print _COMMAND_'s output and
error to their respective channels, and exit with the return value from the
command.

The switch _-e_/_--stderr_ triggers output when the standard error output
length is nonzero. Without _-e_ *kronisk* needs a nonzero return value to
trigger output. In this mode, *kronisk*'s return value will be 2 if
*COMMAND*'s return value is 0 but the command printed something to standard
error.

Written as an exercise in handling Python's I/O channels. Modelled after,
but not plugin-compatible with, *chronic*(1) from the *moreutils* collection
by Joey Hess.

# EXAMPLES

A common use for *kronisk* is for running a cron job:

	\# instead of “my\_command \>/dev/null 2>&1“++
0 1 \* \* \* kronisk my\_command

	\# noisier for debugging++
\* \* \* \* \* kronisk -e my\_other\_command

# SEE ALSO

*chronic*(1)

# AUTHORS

Maintained by Klaus Alexander Seistrup <klaus@seistrup.dk>. Please see
https://github.com/kseistrup/kronisk for full source and bug reports.
