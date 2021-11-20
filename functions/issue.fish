function issue
  set _orig_dir $PWD
  argparse d/directory= -- $argv

  if not string-empty $_flag_directory
    if is-dir $_flag_directory && is-dir $_flag_directory/.git
      cd $_flag_directory
    else
      echo issue: $_flag_directory is not a git repository
      return 1
    end
  end

  set label_args ''
  for label in $argv
    gh label create $label 2> /dev/null
    set label_args $label_args --label $label
  end

  set title (read --prompt-str "Title: ")
  gh issue create --title "$title" (echo "$label_args" | string trim | string split ' ')
  cd $_orig_dir
end
