function test_is-valid-symlink
    touch target

    symlink target link

    rm target

    is-valid-symlink link
    assert $status 1 || return 1

    unsymlink link
end

function test_is-valid-symlink-no-file
    is-valid-symlink not_a_file 2> err.txt

    assert $status 1 || return 1

    set err (cat err.txt)

    assert $err 'is-valid-symlink: not a symlink: not_a_file' || return 1

    remove err.txt
end

function test_is-valid-symlink-not-symlink
    touch target
    is-valid-symlink target 2> err.txt

    assert $status 1 || return 1

    set err (cat err.txt)

    assert $err 'is-valid-symlink: not a symlink: target' || return 1

    remove err.txt target
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_is-valid-symlink \
        test_is-valid-symlink-no-file \
        test_is-valid-symlink-not-symlink

    set result $status

    rmdir-.

    return $result
end

main
