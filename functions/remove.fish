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
        end

        echo 'Cancelling.'
        return 1
    end

    for f in $argv
        if test (basename $f) = ".git"
            confirm-remove $f
            continue
        end

        set gitdirs (find $f -name .git)
        for gitdir in $gitdirs
            confirm-remove $display_dir
        end
    end

    rm $original_args
end
