function git-protocol-https-to-git
    sed -i 's|https://\(\([[:alnum:]]\+\.\)\+[[:alnum:]]\+\)/|git@\1:|' .git/config
end
