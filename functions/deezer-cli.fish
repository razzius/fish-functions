function deezer-cli
  pbpaste | read _clipboard
  echo $argv | pbcopy
  osascript -e 'tell application "Deezer" to activate'
  cliclick c:80,120 c:300,50
  sleep .1
  cliclick kd:cmd t:v ku:cmd
  cliclick kp:enter w:1500 c:280,350
  echo $_clipboard | pbcopy
end
