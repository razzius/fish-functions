function fast-sync-repos
cat ~/.repos.txt | xargs -I@ -P (nproc) fish -c 'sync-repo @'
end
