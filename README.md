# Localpkgenv

Allows to set up local/virtual environments and install packages inside
them.

Localpkgenv is a very lightweight package manager, with primary use case to
setup software in environments where installing the software system-wide (root
access required) is not possible or not desirable.

Package description files can be located inside repositories accessible via
multiple URLs. The following protocols are supported: file:// (default),
http://.

Written in BASH for compatibility, making it possible to bootstrap an
environment without too many other requirements.

## Examples

```
# Install older versions of gcc and make into 'old-build-tools'
$ localpkgenv install old-build-tools gcc-4.4 make-3.80

# Starts a new shell with environment set to use the programs installed inside
# the specified environment directory
$ localpkgenv chenv old-build-tools

# Add a remote package description repository. Additional URLs are processed in
# order, until the requested package description file is found.
$ localpkgenv -p https://raw.github.com/melver/localpkgenv/master/pkg install oldgcc gcc-4.4
```

## Repositories

The provided repo/ directory found with localpkgenv should only serve as an
example of how to write package description files.

List of known repository URLs:

1. github.com/melver/localpkgenv-repo: https://raw.github.com/melver/localpkgenv-repo/master/repo

