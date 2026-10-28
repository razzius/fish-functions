complete -x -f -c umount -a "(__complete_umount)"

function __complete_umount
    set -l last_token (commandline -x)[-1]

    set results (
        mount | string replace -r '^(\S+) \S+ (\S+) .*' '$1\n$2' | string replace -r '[\d.]*:/' / | string match '/*' | string split0
    )

    if equals $last_token umount
        echo $results
        return
    end

    if startswith . $last_token
        echo $results | string replace (pwd) .
        return
    end

    echo $results | unexpand-home-tilde
end
