function clip
    echo -n $argv | unexpand-home-tilde | fish_clipboard_copy
end
