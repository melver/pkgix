# pkgix

Set up prefix environments and install packages inside them.

pkgix is a very lightweight package manager, intended to setup software in
environments where root access is not available or installing the software
system-wide is not desirable.

Package description files can be located inside repositories accessible via
multiple URLs. The following protocols are supported: file:// (default),
http://, https://, ftp://.

Written in BASH making use of standard POSIX tools.

## Examples

```
# Install gcc 4.4 and make 3.80 into 'old-build-tools' from repository.
$ pkgix install old-build-tools dev/gcc-4.4 dev/make-3.80

# Starts a new shell in the chosen prefix environment.
$ pkgix chenv old-build-tools

# Add a remote repository. Additional URLs are processed in
# order, until the requested package description file is found.
$ pkgix -p https://raw.github.com/melver/pkgix/master/pkg install some-prefix dev/gcc-4.4
```

## Repositories

The provided repo/ directory found with pkgix should only serve as an
example of how to write package description files.

List of known repository URLs:

1. [pkgix-repo](https://github.com/melver/pkgix-repo): https://raw.github.com/melver/pkgix-repo/master/pkgs

## Author

Marco Elver <me AT marcoelver.com>

