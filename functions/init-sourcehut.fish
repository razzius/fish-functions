function init-sourcehut
git remote add origin git@git.sr.ht:~$USER/(curdir)
git push origin -o visibility=public --set-upstream
end
