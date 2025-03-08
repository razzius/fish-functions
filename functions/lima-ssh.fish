function lima-ssh
    set default_status (limactl list default -f '{{.Status}}' 2> /dev/null)

    if test $status != 0
        limactl start --tty=false
    end

    if equals $default_status Stopped
        limactl start
    end

    lima
end
