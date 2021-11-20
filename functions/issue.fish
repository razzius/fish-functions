function issue
  argparse d/directory= -- $argv

  if not string-empty $_flag_directory
    if is-dir $_flag_directory && is-dir $_flag_directory/.git
      set repo_dir $_flag_directory
      set url (git -C $repo_dir remote get-url --push origin)
      set repo_info (echo $url | trim-left git@github.com: | trim-right .git)
      set repo_flags "-R" "$repo_info"
    else
      echo issue: $_flag_directory is not a git repository
      return 1
    end
  end

  set label_args ''
  for label in $argv
    gh label $repo_flags create $label
    set label_args $label_args --label $label
  end

  set title (read --prompt-str "Title: ")
  gh issue $repo_flags create --title "$title" (echo "$label_args" | string trim | string split ' ')
end
