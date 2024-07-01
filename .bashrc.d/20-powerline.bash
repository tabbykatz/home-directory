POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
hash pyenv 2>/dev/null && source $HOME/.pyenv/versions/$(pyenv whence powerline | head -n 1)/lib/python*/site-packages/powerline/bindings/bash/powerline.sh
