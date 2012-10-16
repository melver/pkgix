#
# share/localpkgenv/helper-inc.sh: Localpkgenv shell helper. Can be sourced
#      by supported shells to active optional functionality.
#
# Supported (tested with): bash, zsh
#
# Author: Marco Elver <me AT marcoelver.com>
# Date: Wed  3 Oct 15:44:17 BST 2012

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

