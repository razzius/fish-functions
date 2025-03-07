function lima-ssh
    set default_status (limactl list default -f '{{.Status}}' 2> /dev/null)
    if string-empty $default_status || equals $default_status Stopped
        limactl start --tty=false
    end
    lima
end
