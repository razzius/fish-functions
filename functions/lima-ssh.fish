function lima-ssh --argument _name
    set target (default $_name default)

    set default_status (limactl list $target -f '{{.Status}}' 2> /dev/null)

    if test $status != 0 || string-empty $default_status
        limactl start --tty=false $target
    end

    if equals $default_status Stopped
        limactl start $target
    end

    limactl shell $target
end
