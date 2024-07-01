CPU=$(uname -p)

if [[ "$CPU" == "arm" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
elif hash brew 2> /dev/null; then
  export HOMEBREW_PREFIX=$(brew --prefix)
fi

export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}"
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

export HOMEBREW_INSTALL_BADGE=☕
export HOMEBREW_BUNDLE_FILE=${HOME}/.Brewfile
export HOMEBREW_BUNDLE_NO_LOCK=1
