function remove
    set original_args "$argv"

    argparse r f -- $argv

    if not set -q _flag_r || set -q _flag_f
        rm $original_args
        return
    end

    function confirm-remove --argument message
        if not confirm $message
            echo 'Cancelling.'
            exit 1
        end
    end

    for f in $argv
        if exists $f/.git
            confirm-remove "Remove .git directory $f/.git?"
            rm -rf $f/.git
        end
    end

    eval "rm $original_args"
end
