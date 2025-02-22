function git-protocol-https-to-git
    sed -i 's|https://\([[:alnum:]\.]\+\)/|git@\1:|' (git rev-parse --show-toplevel)/.git/config
end
