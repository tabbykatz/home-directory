## Use Apple's man page viewer if we are on a local console
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] || [[ "$TERM_PROGRAM" == "tmux" ]]; then
  function man {
    open x-man-page://"$1"
  }
fi
