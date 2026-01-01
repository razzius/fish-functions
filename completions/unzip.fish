complete --keep-order -x -c unzip -a "(__fish_complete_directories (commandline -ct))"
complete --keep-order -x -c unzip -a "(__unzip_complete_zips)"

function __unzip_complete_zips
    set find_path (__completion_find_path_for_last_token unzip)

    for f in (find $find_path -maxdepth 1 -name '*.zip')
        echo -e "$f\tZip" | string replace -r '^./' ''
    end
end
