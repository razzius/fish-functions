function _paste_avoiding_double_git_clone
    set command (commandline | string trim)
    set clipboard (fish_clipboard_paste | string collect -N)
    if string match -qr '(clone-cd|git clone)' "$command"
        set clipboard (echo $clipboard | string replace 'git clone ' '')
    end
    commandline -i -- $clipboard
end
