function drop --description 'Drop the last n lines from stdin' --argument-names n
    tac | skip $n | tac
end
