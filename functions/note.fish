function note
    if [ "$argv" != '' ]
        echo $argv >>~/notes.org
    else
        pbpaste >>~/notes.org
        echo >>~/notes.org
    end
end
