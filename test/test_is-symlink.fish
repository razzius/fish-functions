function __cleanup
    if string-empty $DEBUG
        unsymlink file-symlink
        rm file.txt
        rmdir-.
    end
end

function test_is-symlink
    touch file.txt
    symlink file.txt file-symlink

    if not is-symlink file-symlink
        error 'Expected is-symlink to report symlink'
        return 1
    end

    if is-symlink file.txt
        error 'expected is-symlink to report not symlink'
        return 1
    end

    if is-symlink nonexistent-file
        error 'Expected is-symlink to report nonexistent file is not symlink'
        return 1
    end
end

function main
    mkdir-cd test_symlink

    run-tap-tests test_is-symlink

    __cleanup
end

main
