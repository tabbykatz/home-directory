export NVM_DIR="$HOME/.nvm"
[ -r "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && . "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" # This loads nvm
[ -r "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion" ] && . "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion"

# [[ -d $NODE_PATH_ ]] && export PATH=$PATH:$NODE_PATH_
hash npm 2> /dev/null && source <(npm completion)
# For compiling the canvas npm package
export PKG_CONFIG_PATH=${HOMEBREW_PREFIX}/opt/libffi/lib/pkgconfig
