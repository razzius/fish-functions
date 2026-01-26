function __completion_find_path_for_last_token --argument-names executable
    set -l previous_token (commandline -x)[-1]

    if equals $previous_token $executable
        echo '.'
        return
    end

    __completion_find_path_for_token $previous_token
end
