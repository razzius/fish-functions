function title-case
    read text
    set words (string split " " -- $text)
    set output (echo $words[1] | capitalize)
    for word in $words[2..-1]
        set output "$output "(echo $word | capitalize)
    end
    echo $output
end
