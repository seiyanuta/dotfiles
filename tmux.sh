# https://github.com/gpakosz/.tmux/blob/master/.tmux.conf
_fpp() {
  tmux capture-pane -J -S - -E - -b "fpp-$1" -t "$1"
  tmux split-window "tmux show-buffer -b fpp-$1 | fpp || true; tmux delete-buffer -b fpp-$1"
}

_copy_to_clipboard() {
  tmux save-buffer - | head 
  echo
  printf "\x1b]52;c;$(tmux save-buffer - | base64)\x07"
  tmux display-message "copied!"
 }
