function post
    cd ~/razzius.github.io/
    set title "$argv"
    set slug (echo $argv | sed 's/ /-/g' | string lower)
    set date (date +%Y-%m-%d)
    set filename _posts/$date-$slug.md

    echo >$filename ---
    echo >>$filename title: $title
    echo >>$filename date: $date
    echo >>$filename ---
end
