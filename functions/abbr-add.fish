function abbr-add
    set cleaned_args (echo $argv | unexpand-home-tilde | trim-trailing-slash)
    abbr -a (echo $cleaned_args | string split ' ')

    abbr > "$HOME/.config/fish/conf.d/abbrs.fish"
end
