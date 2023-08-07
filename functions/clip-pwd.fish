function clip-pwd
    pwd | unexpand-home-tilde | fish_clipboard_copy
end
