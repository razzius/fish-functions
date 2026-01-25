complete -f -c change-dir -a "(__complete_change_dir)"

function __has_only_child_dir --argument-names dir
    set n_children (ls $dir 2> /dev/null | line-count)

    equals $n_children 1 && is-dir $dir/*
end

function __complete_change_dir
    set -l find_path (__completion_find_path_for_last_token cd)
    set -l last_token (commandline -x)[-1]
    set -l find_name (basename $last_token)

    if equals change-dir $last_token || endswith / $last_token
        set name_args -not -name '.*'
    else
        set name_args -iname "$find_name*"
    end

    set exclude_dir_itself_clause -not -name (basename $find_path)

    set find_dirs find $find_path -maxdepth 1 -type d $exclude_dir_itself_clause $name_args
    set find_links find $find_path -maxdepth 1 -type l -exec test -d {} \; $name_args -print
    set dirs ($find_dirs | unexpand-home-tilde) ($find_links | unexpand-home-tilde)

    for d in $dirs
        set path $d

        # As long as there's 1 child only and it's a directory, autocomplete child dirs
        while __has_only_child_dir $path
            set path $path/*
        end

        echo $path/ | string replace -r '^\./' ''
    end
end
