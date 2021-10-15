function clone-cd --argument url _destination
    set destination (default $_destination (repo-from-url $url))
    if file-exists $destination
        cd $destination && git pull
        return
    end

    if test (ls $destination &> /dev/null | word-count) != 0
        mkdir $destination
    end

    git clone --depth=1 $url $destination && cd $destination
end
