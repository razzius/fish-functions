function search
    if not file-exists $RIPGREP_CONFIG_PATH
        echo search: warning: '$RIPGREP_CONFIG_PATH' not configured properly
    end
    rg "$argv"
end
