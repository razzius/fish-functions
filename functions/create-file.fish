function create-file --argument target
    mkdir -p (dirname $target)
    touch $target
end
