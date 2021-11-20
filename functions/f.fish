function f --description 'Jump to a folder in ~/forks' --argument name
    if string-empty $name
        cd ~/forks
        return
    end

    cd (find ~/forks/ -maxdepth 1 -name '*'$name'*')
end
