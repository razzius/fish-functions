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

        echo 'Cancelling.'
        return 1
    end

    for f in $argv
        set gitdirs (find $f -name .git)
        for gitdir in $gitdirs
            confirm-remove $gitdir
        end
    end

    # could be cool to allow remove .
    rm $original_args
end
