function lima-vnc
    set vnc_status (limactl list vnc -f '{{.Status}}' 2> /dev/null)

    if test $status != 0 || string-empty $vnc_status
        limactl start /usr/local/share/lima/templates/experimental/vnc.yaml --tty=false
    end

    if equals $vnc_status Stopped
        limactl start vnc
    end

    set display_info (cat ~/.lima/vnc/vncdisplay)

    set host (echo $display_info | cut -d ':' -f 1)

    set port_offset (echo $display_info | cut -d ':' -f 2)
    set port (math $port_offset + 5900)

    open vnc://:(cat ~/.lima/vnc/vncpassword)@$host:$port
end
