function abbr-add --argument shorthand
    set expansion (echo $argv[2..] | unexpand-home-tilde | trim-trailing-slash)
    set base_abbr "abbr -a -- $shorthand "
    set abbr_command "$base_abbr \"$expansion\""
    eval "$abbr_command"
    set abbr_file "$HOME/.config/fish/conf.d/abbrs.fish"

    set abbr_match (grep --fixed-strings $base_abbr $abbr_file)
    if not string-empty $abbr_match
        echo Removing conflicting abbr $abbr_match
        sed -i /$base_abbr/d $abbr_file
    end

    echo "$abbr_command" >>$abbr_file
    sort -o $abbr_file $abbr_file
end
