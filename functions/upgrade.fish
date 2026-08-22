function upgrade
    if equals (uname) Darwin
        brew upgrade -y $argv
    else
        sudo apt-get upgrade -y $argv
    end
end
