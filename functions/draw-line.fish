function draw-line
    seq $COLUMNS | string replace -r '\d+' - | string join ''
  
end
