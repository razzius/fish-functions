function abbr-erase --argument abbr
    abbr --erase $abbr
    abbr > "$HOME/.config/fish/conf.d/abbrs.fish"
end
