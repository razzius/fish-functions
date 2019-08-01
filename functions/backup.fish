# Defined in - @ line 2
function backup --argument filename
    echo $filename | rev | cut -d / -f 2- | rev | read file
    cp $file $file.bak
end
