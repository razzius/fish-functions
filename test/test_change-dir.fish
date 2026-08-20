function __cleanup
    unsymlink source
    rmdir target
    rmdir-.
end

function test_change-dir_symlink
    set result 0

    mkdir target
    symlink target source

    change-dir source

    if not equals (curdir) target
        error 'test_cd_symlink: cd did not resolve symlink. curdir '(curdir)', expected target'
        set result 1
    end

    cd ..
    return $result
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_change-dir_symlink

    __cleanup
end

main
