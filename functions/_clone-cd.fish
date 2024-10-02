function _clone-cd --argument url destination cloneargs
    if file-exists $destination
        echo 'Already cloned. Attempting pull...'
        cd $destination && git pull
        return
    end

    git clone $cloneargs $url $destination && cd $destination
end
