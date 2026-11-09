function __completion_find_path_for_last_token
    set command_line (commandline -x)

    if equals (echo $command_line | word-count) 1
        echo '.'
        return
    end

    set last_token $command_line[-1]

    __completion_find_path_for_token $last_token
end
