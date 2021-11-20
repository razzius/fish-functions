function new --argument project
    mkdir $project
    cd $project
    git init
    gh repo create $project
    git branch --set-upstream-to=origin/main main
end
