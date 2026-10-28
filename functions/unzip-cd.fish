function unzip-cd --argument zipfile
    set folder (zip -sf $zipfile | row 2 | string trim)
    clean-unzip $zipfile && cd $folder
end
