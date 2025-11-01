function new --argument project
    mkdir-cd $project \
        && git init \
        && echo "# $project" > README.md \
        && git add README.md \
        && git commit -m 'Initial commit'
end
