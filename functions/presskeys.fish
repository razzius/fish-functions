function presskeys --argument keys
    osascript -e "tell application \"System Events\"
 keystroke \"$keys\"
end tell"
end
