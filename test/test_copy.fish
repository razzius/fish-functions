mkdir-cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        rm -f a.txt b.txt error.txt contents.txt
        rm -rf git_repo
        rm -rf dir/ another/
        rmdir-.
    end
end

function test_basic_behavior
    set contents 'contents a'

    echo $contents > a.txt

    copy a.txt b.txt 2> error.txt

    set result_status $status
    set expected_status 0

    if not equals $result_status $expected_status
        echo Expected status $expected_status but got $result_status
        return 1
    end

    set output (cat b.txt)

    if not string match -q $contents $output
        echo `copy` did not behave as expected.
        return 1
    end
end

function test_to_multiple_directory_levels
    mkdir from_dir

    echo 'contents' > from_dir/file.txt

    mkdir -p dir1/dir2

    copy from_dir/ dir1/dir2/

    rm dir1/dir2/from_dir/file.txt
    rmdir dir1/dir2/from_dir
    rmdir dir1/dir2
    rmdir dir1
    rm from_dir/file.txt
    rmdir from_dir
end

function test_no_prompt_file_committed
    mkdir-cd git_repo
    git init --quiet
    echo 'from' > from.txt
    echo 'to' > to.txt
    git add to.txt
    git commit --quiet -m 'Add to.txt so it can be safely deleted'

    # n would cancel if it prompted, but it shouldn't prompt
    echo n | copy from.txt to.txt

    if not equals (cat to.txt) 'from'
        error "copy didn't copy successfully"
        cd ..
        return 1
    end

    cd ..
end

function test_allow_-r_flag
    mkdir dir/
    touch dir/file.txt

    mkdir another/

    copy -r dir/ another/

    ls another/ > contents.txt

    if not equals (cat contents.txt) 'dir'
        error "copy should preserve directory even with redundant -r flag"
        return 1
    end
end

function test_multiple_source_dirs
    mkdir a
    mkdir b
    touch a/a
    touch b/b
    mkdir c
    copy a b c
    rm -r a b c
end

function main
    test_basic_behavior
    test_to_multiple_directory_levels
    test_no_prompt_file_committed
    test_allow_-r_flag
    test_multiple_source_dirs
end

main
__cleanup
