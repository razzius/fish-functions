function clean-unzip --argument zipfile
    set extension (echo $zipfile | string sub --start=-4)
    if not contains $extension '.zip' '.jar'
        echo (status function): argument must be a zipfile or jarfile
        return 1
    end

    if is-clean-zip $zipfile
        unzip $zipfile
    else
        set folder_name (echo $zipfile | until-char .)
        set target (basename $folder_name)
        mkdir $target || return 1
        unzip $zipfile -d $target
    end
end
