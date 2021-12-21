function get-source --argument app
  set formula_path (brew edit --print-path $app)
  set github_url (cat $formula_path | grep github | coln 2 | string trim -c \")
  clone $github_url
end
