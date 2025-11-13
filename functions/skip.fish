function skip --argument n -d 'skip <n>: Skip the first n lines of stdin'
    tail +(math 1 + $n)
end
