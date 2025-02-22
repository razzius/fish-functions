function lima-ssh
    set default_status (limactl list default -f '{{.Status}}')
    if test $status != 0 || test $default_status = Stopped
        limactl start --tty=false
    end
    lima
end
