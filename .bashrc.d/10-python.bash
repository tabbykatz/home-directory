# Dynamic Python library for YouCompleteMe
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
hash pyenv 2> /dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
hash pyenv 2> /dev/null && pyenv virtualenvwrapper_lazy

# pip
export PIP_REQUIRE_VIRTUALENV=true

syspip() {
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
