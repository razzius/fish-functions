function ver --argument program
    if contains $program ssh tmux
        $program -V
    else if equals $program java
        $program -version
    else if equals $program go
        $program version
    else if contains $program vi vim
        # vim version info is way too verbose
        $program --version | take 1
    else
        $program --version
    end
end
