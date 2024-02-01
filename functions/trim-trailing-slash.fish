function trim-trailing-slash
    read str
    string replace -r '/$' '' -- $str
end
