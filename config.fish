if not status is-interactive
    exit
end

for f in ~/.config/fish/functions/private/*
    source $f
end

bind \e\[1\;5A history-token-search-backward
bind \e\[1\;5B history-token-search-forward
bind \cW backward-kill-word

bind \ct transpose-chars

source ~/.profile
source ~/.fish_abbrs.fish

# source (pyenv init -|psub)
eval (python3 -m virtualfish)

function postexec_source_profile --on-event fish_postexec
  if enabled "$DEBUG"
    echo argv: "$argv"
  end

  if test "$argv" = '$EDITOR ~/.profile'
    if enabled "$DEBUG"
      echo going to source profile
    end
    source ~/.profile
  end

  if test "$argv" = '$EDITOR ~/.config/fish/config.fish'
      if enabled "$DEBUG"
          echo going to source fish config
      end
      source ~/config/fish/config.fish
  end
end
