function localbackup --argument filename
set target (echo $filename | string replace -a / \\)
copy $filename ./$target
end
