# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.qFxqpH/post.fish @ line 2
function post
	set title "$argv"
  set slug (echo $argv | sed 's/ /-/g' | lower)
  set date (date +%Y-%m-%d)
	set filename _posts/$date-$slug.md

  echo > $filename ---
  echo >> $filename title: $title
  echo >> $filename date: $date
  echo >> $filename ---
end
