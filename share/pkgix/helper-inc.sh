#
# share/pkgix/helper-inc.sh: pkgix shell helper. Can be sourced
#      by supported shells to active optional functionality.
#
# Supported (tested with): bash, zsh
#
# Copyright (C) 2012, Marco Elver <me@marcoelver.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Easier to detect shell when sourced, rather than by pkgix itself.
if [[ -z "$PKGIX_SHELL" ]]; then
	[[ -n "$BASH" ]] && export PKGIX_SHELL="$BASH"
	[[ -n "$ZSH_VERSION" ]] && export PKGIX_SHELL="$(which zsh)"
fi

pkgix-activate() {
	if [[ -n "$PKGIX_PREFIX" ]]; then
		echo "You need to deactivate your current prefix environment with 'pkgix-deactivate' first."
		return 1
	fi

	if [[ "$#" == "0" ]]; then
		echo "Need at least one prefix!"
		return 1
	fi

	_OLD_PATH="$PATH"
	_OLD_LD_RUN_PATH="$LD_RUN_PATH"
	_OLD_LIBRARY_PATH="$LIBRARY_PATH"
	_OLD_PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
	_OLD_CPATH="$CPATH"
	eval "$(pkgix showenv "$@")"

	_OLD_PS1="$PS1"
	PS1=$'\e[1;35m<+>\e[0m'"$PS1"
}

pkgix-deactivate() {
	unset PKGIX_PREFIX

	export PATH="$_OLD_PATH"
	export LD_RUN_PATH="$_OLD_LD_RUN_PATH"
	export LIBRARY_PATH="$_OLD_LIBRARY_PATH"
	export PKG_CONFIG_PATH="$_OLD_PKG_CONFIG_PATH"
	export CPATH="$_OLD_CPATH"

	PS1="$_OLD_PS1"
}

