function __confirm-remove-git-objects --argument dir
    set display_dir (echo $dir | unexpand-home-tilde)

    if not confirm "Remove .git directory $display_dir?"
        error 'remove: cancelling.'
        return 1
    end

    rm -rf $dir/objects
end

function remove
    set original_args $argv

    argparse r f -- $argv

    if not set -q _flag_r || set -q _flag_f
        rm $original_args
        return
    end

    for f in $argv
        if not file-exists $f
            echo "remove: $f: No such file or directory"
            return 1
        end

        set gitdirs (find $f -name .git)

        for gitdir in $gitdirs
            if not __confirm-remove-git-objects $gitdir
                return 1
            end
        end
    end

    rm $original_args
end
