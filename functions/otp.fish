function otp --wraps 'pass show' --description 'Get an OTP code from pass' --argument-names site
    set otp_code (pass otp $site) || return 1
    echo $otp_code | fish_clipboard_copy
    echo "Copied OTP code $otp_code for $site to clipboard."
end
