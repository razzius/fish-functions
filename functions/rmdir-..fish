function rmdir-.
    set dir (pwd)
    rmdir $dir && cd ..
end
