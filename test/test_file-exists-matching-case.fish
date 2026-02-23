mkdir-cd (mkusertemp)

function main
    echo 'TAP version 14'
    echo '1..2'
    touch file.txt
    set result 0

    if file-exists-matching-case FILE.txt
        error file-exists should be case-sensitive
        echo not ok
    else
        echo ok
    end

    mkdir another
    touch another/file.txt

    if not file-exists-matching-case file.txt
        error file-exists should look in the current directory only
        echo not ok
    else
        echo ok
    end

    rm -r another
    rm file.txt
    rmdir-.

    return $result
end

main
