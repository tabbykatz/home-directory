export EDITOR=edit
export LANG=en_US.UTF-8

[[ -d ~/.bin ]] && export PATH=~/.bin:$PATH

# Keep bash history across terminals and write immediately
# http://linuxcommando.blogspot.com/2007/11/keeping-command-history-across-multiple.html
shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# use .localrc for settings specific to one system
[[ -r ~/.localrc ]] && source ~/.localrc

ulimit -n 24576

export LS_OPTIONS="--git --group-directories-first"
