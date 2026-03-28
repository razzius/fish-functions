function unzip-cd --argument zipfile
    clean-unzip $zipfile && cd (echo $zipfile | until-char .)
end
