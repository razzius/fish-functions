function register-sync-repos --argument-names repos
    set -xg SYNC_REPOS (echo $repos | filter-blank-lines | expand-home-tilde)
end
