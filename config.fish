if not status is-interactive
    exit
end

if not test -n "$TMUX"
    tmux
end

for f in ~/.config/fish/functions/private/*
    source $f
end

bind \e\[1\;5A history-token-search-backward
bind \e\[1\;5B history-token-search-forward

bind \ct transpose-chars

# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

source ~/.profile
source ~/.fish_abbrs.fish

source (pyenv init -|psub)
eval (python3 -m virtualfish)

function postexec_source_profile --on-event fish_postexec
  if test "$argv" = "vi ~/.profile"
    source ~/.profile
  end
end
