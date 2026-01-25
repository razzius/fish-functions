complete -f -c change-dir -a "(__complete_change_dir)"

function __has_only_child_dir --argument-names dir
    set n_children (ls $dir 2> /dev/null | line-count)
    equals $n_children 1 && is-dir $dir/*
end

function __complete_change_dir
    set -l find_path (__completion_find_path_for_last_token cd)

    set -l previous_token (commandline -x)[-1]
    set last_path_element (echo $previous_token | string replace -r '.*/' '')

    if equals $previous_token change-dir || string-empty $last_path_element
        set name_args -not -name '.*'
    else
        set name_args -iname "*$last_path_element*"
    end

    set exclude_dir_itself_clause -not -name (basename $find_path)

    set find_cmd find $find_path -maxdepth 1 -type d $exclude_dir_itself_clause $name_args
    set dirs ($find_cmd | unexpand-home-tilde)

    for d in $dirs
        set path $d

        # As long as there's 1 child only and it's a directory, autocomplete child dirs
        while __has_only_child_dir $path
            set path $path/*
        end

        echo $path/ | string replace -r '^\./' ''
    end
end
