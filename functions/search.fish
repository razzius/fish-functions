function search
    if string-empty $RIPGREP_CONFIG_PATH || not file-exists $RIPGREP_CONFIG_PATH
        echo search: warning: '$RIPGREP_CONFIG_PATH' not configured properly
    end
    rg "$argv"
end
