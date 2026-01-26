function __completion_find_path_for_token --argument-names token
    # Anything after the last slash isn't part of the path for find
    set base_path (echo $token | string replace -r '[^/]+$' '')
    default $base_path './'
end
