function test_is-broken-symlink
    touch target

    symlink target link

    rm target

    is-broken-symlink link
    assert $status 0

    unsymlink link
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_is-broken-symlink

    rmdir-.
end

main
