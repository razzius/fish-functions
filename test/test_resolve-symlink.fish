function test_resolve-symlink
    touch target

    symlink target link

    assert (resolve-symlink link) (pwd)/target

    unsymlink link
    remove target
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_resolve-symlink

    rmdir-.
end

main
