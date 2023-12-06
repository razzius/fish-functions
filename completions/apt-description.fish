complete -x -c apt-description -a '(dpkg --get-selections | grep -v deinstall | coln 1)'
