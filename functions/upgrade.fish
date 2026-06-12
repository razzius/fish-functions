function upgrade
    if equals (uname) Darwin
        brew upgrade
    else
        sudo apt-get upgrade -y
    end
end
