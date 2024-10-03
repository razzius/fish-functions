function clone-cd --argument url _destination
    set destination (default $_destination (repo-from-url $url))

    _clone-cd $url $destination
end
