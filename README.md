# Localenv

Allows to set up local/virtual environments and install packages inside
them.

Localenv is essentially a very lightweight package manager, with primary use
case to just be able to setup software in environments where installing the
software system-wide (root access required) is not possible or not desirable.

Currently package description files can be located inside repositories
accessible via multiple URLs. The following protocols are supported:
file:// (default), http://.

Written in BASH for compatibility, making it possible to bootstrap an
environment without too many other requirements.

More details will follow ...

