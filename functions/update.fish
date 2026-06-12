function update
    if equals (uname) Darwin
        brew update
    else
        sudo apt-get update
    end
end
