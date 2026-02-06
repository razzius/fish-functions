mkdir-cd (mkusertemp)

function main
    touch file.txt
    set result 0

    if file-exists FILE.txt
        error file-exists should be case-sensitive
    end

    mkdir another
    touch another/file.txt

    if not file-exists file.txt
        error file-exists should look in the current directory only
    end

    rm -r another
    rm file.txt
    rmdir-.

    return $result
end

main
