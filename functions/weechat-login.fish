function weechat-login
    env WEECHATPASS=(pass weechat) expect -c '
      spawn weechat
      expect "=> "
      send -- "$env(WEECHATPASS)\r"
      interact'
end
