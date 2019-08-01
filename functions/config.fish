function config --argument KEY VALUE
    echo export $KEY=\"$VALUE\" >>~/.profile
    source ~/.profile
end
