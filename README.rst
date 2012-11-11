=====
pkgix
=====

Set up prefix environments and install packages inside them.

pkgix is a very lightweight package manager, intended to setup software in
environments where root access is not available or installing the software
system-wide is not desirable.

Package description files can be located inside repositories accessible via
multiple URLs. The following protocols are supported: ``file://`` (default),
``http://``, ``https://``, ``ftp://``.

Written in BASH making use of standard POSIX tools.

Setup
=====

It is possible to run ``pkgix`` directly, if you provide a valid repository.

By default pkgix looks for a repository in ``~/pkgix-repo/pkgs``. Repositories
can be specified using the ``-r`` flag, but it is recommended to export the
repository URL/path with ``PKGIX_REPO_URLS="<repo-urls...>"`` (separated by ``;``).
See the Repositories section below for list of known repositories.

Recommended:
------------

- Add ``<path-to-pkgix>/bin`` to your ``PATH``.
- ``source "<path-to-pkgix>/share/pkgix/helper-inc.sh"``; currently supported: bash, zsh.
  Provides the ``pkgix-activate`` and ``pkgix-deactivate`` functions; annotates
  shell prompt to indicate active prefix environment.

Examples
========

.. code-block:: sh

    # Install gcc 4.4 and make 3.80 into 'old-build-tools' from repository.
    $ pkgix install old-build-tools dev/gcc-4.4 dev/make-3.80

    # Starts a new shell in the chosen prefix environment.
    $ pkgix chenv old-build-tools

    # Add a remote repository. Additional URLs are processed in
    # order, until the requested package description file is found.
    $ pkgix -r https://raw.github.com/melver/pkgix/master/pkgs install some-prefix dev/gcc-4.4

Repositories
============

List of known repository URLs:

1. `pkgix-repo <https://github.com/melver/pkgix-repo>`_: https://raw.github.com/melver/pkgix-repo/master/pkgs

