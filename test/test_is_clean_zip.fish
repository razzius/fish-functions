cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        remove -rf clean_dir clean_dir.zip
        remove -rf file.txt dirty_dir dirty_dir.zip
        remove -rf folder mixed_dir.zip
        rmdir-.
    end
end

function test_is_clean_zip_true_positive
    # Having a folder inside it makes it clean
    mkdir clean_dir

    touch clean_dir/file.txt

    zip --quiet -r clean_dir.zip clean_dir

    if not is-clean-zip clean_dir.zip
        error is-clean-zip should recognize clean_dir.zip as clean
        return 1
    end
end

function test_is_clean_zip_not_clean
    touch file.txt

    zip --quiet -r dirty_dir.zip file.txt

    if is-clean-zip dirty_dir.zip
        error is-clean-zip should recognize dirty_dir.zip as dirty
        return 1
    end
end

function test_is_clean_zip_mix_folder_files
    touch file.txt

    mkdir folder
    touch folder/clean_file.txt

    zip --quiet -r mixed_dir.zip file.txt folder

    if is-clean-zip mixed_dir.zip
        error is-clean-zip of a zip that has a directory but also toplevel files should be dirty
    end

    rm mixed_dir.zip

    zip --quiet -r mixed_dir.zip folder file.txt

    if is-clean-zip mixed_dir.zip
        error "is-clean-zip of a zip that has a directory but also toplevel files should be dirty (other order)"
    end
end

function main
    test_is_clean_zip_true_positive
    test_is_clean_zip_not_clean
    test_is_clean_zip_mix_folder_files
end

main
__cleanup
