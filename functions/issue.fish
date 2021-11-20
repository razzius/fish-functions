function issue
  argparse d/directory= -- $argv

  if not string-empty $_flag_directory
    if is-dir $_flag_directory && is-dir $_flag_directory/.git
      set repo_dir $_flag_directory
    else
      echo issue: $_flag_directory is not a git repository
      return 1
    end
  else
    set repo_dir .
  end

  set -l url (git -C $repo_dir remote get-url --push origin)
  set -l repo_info (echo $url | trim-left git@github.com: | trim-right .git)

  set label_args ''
  for label in $argv
    gh label -R $repo_info create $label
    set label_args $label_args --label $label
  end

  set title (read --prompt-str "Title: ")
  eval "gh issue create -R $repo_info --title "$title" $label_args"
end
