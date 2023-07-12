function tgz --argument contents _destination
    set default_archive_name (echo $contents | trim-trailing-slash)".tar.gz"
    set destination (default $_destination $default_archive_name)
    tar --create --gzip --file=$destination $contents
end
