function colorpicker
  set rgb (osascript -e 'choose color' | string split ,)
  for color in $rgb
    printf %02x (math round $color / (printf %d 0x101))
  end
end
