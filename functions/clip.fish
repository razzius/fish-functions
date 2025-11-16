function clip
    status current-commandline | trim-left 'clip ' | fish_clipboard_copy
end
