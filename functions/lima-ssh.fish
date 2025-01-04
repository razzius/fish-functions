function lima-ssh
    if test (limactl list default -f '{{.Status}}') = Stopped
        limactl start
    end
    lima
end
