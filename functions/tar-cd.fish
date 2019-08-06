function tar-cd --argument tarfile
    tar -xvzf $tarfile
    cd (echo $tarfile | trim-right '.tar.gz')
end
