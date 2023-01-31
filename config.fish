# This is a hack to prevent this file from being sourced twice
if not status is-interactive
    exit
end

for f in ~/.config/fish/functions/private/*
    source $f
end

# Binds option-up
bind \e\[1\;5A history-token-search-backward
# Binds super-up (for emacs vterm integration, where there is no "option"
bind \e\[1\;2A history-token-search-backward

# option-down
bind \e\[1\;5B history-token-search-forward
# super-down
bind \e\[1\;2B history-token-search-forward

# Make C-t transpose characters :)
bind \ct transpose-chars

# Make C-s accept autocompletion and submit :))
bind \cs accept-autosuggestion execute

test -e ~/.profile && source ~/.profile

function postexec-source-profile --on-event fish_postexec
    set command_line (echo $argv | string collect | string trim)

    if string match -qr "^$EDITOR " $command_line
        set file (echo $command_line | coln 2 | string replace '~' $HOME)
        for config_file in ~/.profile ~/.config/fish/config.fish
            if test (realpath -- $file) = (realpath $config_file)
                echo -n "Sourcing "(echo $file | unexpand-home-tilde)"... "
                source $file
                echo done.
            end
        end
    end
end

# TODO rewrite this using event emitters
function save-error --on-event fish_postexec
    set exit_status $status
    set cancel_status 130

    if not contains $exit_status 0 $cancel_status && \
      not startswith retry "$argv" && \
      not startswith sudo-retry "$argv"
        set -g failed_command "$argv"
    end
end

function save-edited-file --on-event fish_postexec
    set command_line (echo $argv | string collect | string trim)
    if string match -qr "^($EDITOR|edit) " "$command_line"
        set -g editor_command $argv
    end
end
