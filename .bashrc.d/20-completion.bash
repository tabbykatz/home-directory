# shellcheck source=/dev/null
export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"

hash brew 2> /dev/null \
  && [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] \
  && source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

# tabtab source for packages
# uninstall by removing these lines
[ -r ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true
