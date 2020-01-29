function edit-private --argument name
    set file ~/.config/fish/functions/private/$name.fish
    $EDITOR $file
    source $file
end
