function clone-cd --argument url _destination
    set destination (default $_destination (repo-from-url $url))
    if file-exists $destination
        cd $destination && git pull
        return
    end

    if not dir-exists $destination
        mkdir $destination
    end

    git clone --depth=1 $url $destination && cd $destination
end
