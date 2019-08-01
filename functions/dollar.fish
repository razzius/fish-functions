function dollar --description 'Remove the starting $ from example shell commands'
    while read -l line
        eval (echo $line | cut -d ' ' -f 2-)
    end
end
