function f --argument project -d 'Jump to a folder in ~/forks'
  set match (ls ~/forks/ | string match $project'*')
  cd ~/forks/$match
end
