function edit-private --argument name
    mkdir -p ~/.config/fish/functions/private
    set file ~/.config/fish/functions/private/$name.fish
    echo "function $name" >>$file
    echo end >>$file
    $EDITOR $file
    source $file
end
