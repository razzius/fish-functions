function vdrop --argument file
    echo \x1b]'51;["drop", "'$file'"]'\x07
end
