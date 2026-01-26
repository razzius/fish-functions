complete -f -c change-dir -a "(__complete_change_dir)"

function __has_only_child_dir --argument-names dir
    set n_children (ls $dir 2> /dev/null | line-count)

    equals $n_children 1 && is-dir $dir/*
end

# some test cases
# cd ./ findpath ./ findname ''
# cd ~/ findpath /Users/razzi/ findname ''
# cd / findpath / findname ''
# cd dir/another findpath dir/ findname another
# cd .git/hook findpath .git/ findname hook
# cd fofo findpath ./ findname fofo
# cd - findpath ./ findname -

function __get_find_name_for_path --argument-names path
    echo $path | string replace -r '.*/' ''
end

function __escape_period --argument-names value
    echo -- $value | string replace '.' '\.'
end

function __get_find_regex_for_token --argument-names token find_path
    set -l find_name (__get_find_name_for_path $token)
    set -l find_name_split (echo $find_name | string split '')
    set -l find_name_escaped (__escape_period $find_name_split)
    set -l find_path_escaped (__escape_period $find_path)
    set -l find_regex $find_path_escaped(echo $find_name_escaped | string join '.*')'.*'
    echo $find_regex
end

function __find_dirs_for_commandline_arg --argument-names find_path last_token
    if equals change-dir $last_token || endswith / $last_token
        set name_args -not -name '.*'
    else
        set name_args -iregex (__get_find_regex_for_token $last_token $find_path)
    end

    set exclude_dir_itself_clause -not -name (basename $find_path)

    find $find_path -maxdepth 1 -type d $exclude_dir_itself_clause $name_args
    find $find_path -maxdepth 1 -type l -exec test -d {} \; $name_args -print
end

function __complete_change_dir
    set -l find_path (__completion_find_path_for_last_token cd)
    set -l last_token (commandline -x)[-1]

    set -l dirs (__find_dirs_for_commandline_arg $find_path $last_token)

    for d in $dirs
        set path $d

        # As long as there's 1 child only and it's a directory, autocomplete child dirs
        while __has_only_child_dir $path
            set path $path/*
        end

        echo $path/ | string replace -r '^\./' '' | unexpand-home-tilde
    end
end
