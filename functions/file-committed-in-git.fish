function file-committed-in-git --argument-names file
    set parent_dir (dirname $file)

    if not in-git-repo $parent_dir
        return 1
    end

    if not git ls-files --error-unmatch $file &> /dev/null
        return 1
    end

    # If the file is staged, it's tracked in git, but not committed
    if not git diff --quiet --staged $file
        return 1
    end
end
