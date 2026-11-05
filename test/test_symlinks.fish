function __cleanup
    if string-empty $DEBUG
        unsymlink link
        remove somefile

        unsymlink dir/link
        remove dir/somefile
        rmdir dir/

        rmdir-.
    end
end

function test_symlinks
    touch somefile

    symlink somefile link

    assert (symlinks) link
end

function test_symlinks-other-dir
    mkdir dir

    touch dir/somefile

    symlink dir/somefile dir/link

    assert (symlinks dir/) link
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_symlinks \
        test_symlinks-other-dir

    __cleanup
end

main
