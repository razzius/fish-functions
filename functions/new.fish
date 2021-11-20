function new --argument project
    mkdir $project
    cd $project
    git init
    gh repo create
end
