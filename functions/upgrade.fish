function upgrade
    if equals (uname) Darwin
        brew upgrade -y
    else
        sudo apt-get upgrade -y
    end
end
