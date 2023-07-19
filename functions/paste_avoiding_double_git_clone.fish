function paste_avoiding_double_git_clone
    set command (commandline | string trim)
    set clipboard (wl-paste -n | string collect -N)
    if string match -q clone-cd $command
        set clipboard (echo $clipboard | string replace 'git clone ' '')
    end
    commandline -i -- $clipboard
end
