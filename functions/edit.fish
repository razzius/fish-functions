function edit
    if string-empty $argv
        eval "$editor_command"
        return
    end

    vtab $argv
    # $EDITOR $argv
end
