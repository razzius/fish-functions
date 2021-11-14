function deezer-cli
  pbpaste | read _clipboard
  echo $argv | pbcopy
  osascript -e 'tell application "Deezer" to activate'
  cliclick -r \
    kd:cmd kp:arrow-left ku:cmd \
    c:80,120 c:300,50 w:100 \
    kd:cmd t:a ku:cmd \
    kd:cmd t:v ku:cmd \
    kp:enter \
    w:1500 \
    c:280,350
  echo $_clipboard | pbcopy
end
