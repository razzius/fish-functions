function clip
    status current-commandline | string trim | trim-left 'clip ' | fish_clipboard_copy
end
