function _paste-avoiding-double-git-clone
    set command (commandline | string trim)
    set clipboard (fish_clipboard_paste | string collect -N)
    if string match -qr '(clone-cd|clone-shallow-cd|git clone)' "$command"
        set clipboard (echo $clipboard | string replace 'git clone ' '')
    end
    commandline -i -- $clipboard
end
