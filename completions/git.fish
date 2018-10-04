function __fish_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv)  ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i]  ]
                return 1
            end
        end
        return 0
    end
    return 1
end

complete -x -c git -n '__fish_using_command git to' -a '(git branch-names)'
