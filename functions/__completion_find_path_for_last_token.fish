function __completion_find_path_for_last_token --argument-names executable
    set -l previous_token (commandline -x)[-1]

    if equals $previous_token $executable
        set base_path ''
    else
        # Anything after the last slash shouldn't be passed to find
        set base_path (echo $previous_token | string replace -r '[^/]+$' '')
    end

    default $base_path '.'
end
