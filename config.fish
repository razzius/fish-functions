bind \ct transpose-chars

# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end

source ~/.profile

eval (python -m virtualfish)
status --is-interactive; and source (pyenv init -|psub)
