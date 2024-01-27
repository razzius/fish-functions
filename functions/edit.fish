function edit
    if string-empty $argv
        eval "$editor_command"
        return
    end

    $EDITOR $argv
end
