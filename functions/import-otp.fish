function import-otp --argument-names image
    set otpdata (zbarimg --raw --quiet $image)
    set issuer (trurl $otpdata -g '{query:issuer}')
    set issuer_search (echo -n $issuer | tr -C '[:alnum:]' '*')
    set passfile (find-matching-pass $issuer_search)
    if not confirm "Write otpauth to "(basename $passfile)"? "
        return 1
    end
    set passdomain (basename $passfile | trim-right .gpg)
    echo $otpdata | pass otp append $passdomain
    git -C ~/.password-store push
end
