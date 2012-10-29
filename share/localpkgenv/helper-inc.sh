#
# share/localpkgenv/helper-inc.sh: Localpkgenv shell helper. Can be sourced
#      by supported shells to active optional functionality.
#
# Supported (tested with): bash, zsh
#
# Copyright (C) 2012, Marco Elver <me AT marcoelver.com>
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

# Easier to detect shell when sourced, rather than by locakpkgenv itself.
if [[ -z "$LOCALPKGENV_SHELL" ]]; then
	[[ -n "$BASH" ]] && export LOCALPKGENV_SHELL="$BASH"
	[[ -n "$ZSH_VERSION" ]] && export LOCALPKGENV_SHELL="$(which zsh)"
fi

localpkgenv-activate() {
	if [[ -n "$LOCALPKGENV_ROOT" ]]; then
		echo "You need to deactivate your current local environment with 'localpkgenv-deactivate' first."
		return 1
	fi

	if [[ "$#" == "0" ]]; then
		echo "Need at least one localpkgenv root!"
		return 1
	fi

	_OLD_PATH="$PATH"
	_OLD_LD_RUN_PATH="$LD_RUN_PATH"
	_OLD_LIBRARY_PATH="$LIBRARY_PATH"
	_OLD_PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
	_OLD_CPATH="$CPATH"
	eval "$(localpkgenv showenv "$@")"

	_OLD_PS1="$PS1"
	PS1=$'\e[1;35m<+>\e[0m'"$PS1"
}

localpkgenv-deactivate() {
	unset LOCALPKGENV_ROOT

	export PATH="$_OLD_PATH"
	export LD_RUN_PATH="$_OLD_LD_RUN_PATH"
	export LIBRARY_PATH="$_OLD_LIBRARY_PATH"
	export PKG_CONFIG_PATH="$_OLD_PKG_CONFIG_PATH"
	export CPATH="$_OLD_CPATH"

	PS1="$_OLD_PS1"
}

