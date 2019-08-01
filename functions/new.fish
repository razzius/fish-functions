function new --argument project
    mkdir $project
    cd $project
    git init
    hub create
end
