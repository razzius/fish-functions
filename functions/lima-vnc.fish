function lima-vnc
    set vnc_status (limactl list vnc -f '{{.Status}}' 2> /dev/null)

    if test $status != 0 || string-empty $vnc_status
        limactl start /usr/local/share/lima/templates/experimental/vnc.yaml --tty=false
    end

    if equals $vnc_status Stopped
        limactl start vnc
    end

    open vnc://:(cat ~/.lima/vnc/vncpassword)@127.0.0.1:5900
end
