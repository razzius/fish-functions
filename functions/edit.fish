function edit
    if not any-arguments $argv
        eval "$editor_command"
        return
    end

    vtab $argv
    # $EDITOR $argv
end
