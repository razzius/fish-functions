function new --argument project
    mkdir $project \
      && cd $project \
      && git init \
      && gh repo create --public --confirm $project \
      && echo "# $project" > README.md \
      && git add README.md \
      && git commit -m 'Initial commit' \
      && git push --set-upstream
end
