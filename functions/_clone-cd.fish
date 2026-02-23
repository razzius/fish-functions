function _clone-cd --argument-names url _destination cloneargs
    set destination (default $_destination (_repo-from-url $url))

    if file-exists $destination
        echo 'Already cloned. Attempting pull...'
        cd $destination && git pull
        return
    end

    git clone $cloneargs $url $destination && cd $destination
end
