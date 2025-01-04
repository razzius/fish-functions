function remove
    set original_args $argv

    argparse r f -- $argv

    if not set -q _flag_r || set -q _flag_f
        rm $original_args
        return
    end

    function confirm-remove --argument dir
        set display_dir (echo $dir | unexpand-home-tilde)

        if confirm "Remove .git directory $display_dir?"
            rm -rf $dir
            return
        end

        return 1
    end

    for f in $argv
        if not file-exists $f
            echo "remove: $f: No such file or directory"
            return 1
        end

        set gitdirs (find $f -mindepth 1 -name .git)
        for gitdir in $gitdirs
            if not confirm-remove $gitdir
                echo 'remove: cancelling.'
                return 1
            end
        end
    end

    # could be cool to allow remove .
    rm $original_args
end
