function f --description 'Jump to a folder in ~/forks' --argument project
  set match (ls ~/forks/ | string match $project'*' | head -1)
  cd ~/forks/$match
end
