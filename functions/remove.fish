function remove
    set original_args $argv

    argparse r f -- $argv

    if not set -q _flag_r || set -q _flag_f
        rm $original_args
        return
    end

    function confirm-remove --argument message
        if not confirm $message
            echo 'Cancelling.'
            return 1
        end
    end

    for f in $argv
        set gitdirs (find $f -name .git)
        for gitdir in $gitdirs
            set display_dir (echo $gitdir | unexpand-home-tilde)
            confirm-remove "Remove .git directory $display_dir?"
            rm -rf $gitdir
        end
    end

    rm $original_args
end
