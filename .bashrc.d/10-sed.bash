if hash gsed 2>/dev/null; then
  brew_prefix=$(brew --prefix)

  export PATH=$brew_prefix/opt/gnu-sed/libexec/gnubin:$PATH
fi
