complete -c unsymlink -f -a '(find $PWD -type l -exec realpath --no-symlinks --relative-to $PWD {} \;)'
