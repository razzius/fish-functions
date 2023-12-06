function apt-description --argument package
apt-cache show $package | sed '/^$/Q' | grep --color=never -E '^Description-en:|^ '
end
