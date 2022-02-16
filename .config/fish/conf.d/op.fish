function op_login
    set tok (op signin dukeu --raw)
    if [ $status -eq 0 ]
      echo "Tight, you are logged in 😁"
      set -Ux OP_SESSION_dukeu $tok
      set -U OP_EXPIRATION_TIME (date -v +30M -u +%s)
    else
      echo "1password login failed 😢" 1>&2
      return 2
    end

    #set -Ux OP_SESSION_dukeu (op signin dukeu --raw)
    #set -U OP_EXPIRATION_TIME (date -v +30M -u +%s)
end

function op_logout
    set -e OP_SESSION_dukeu
    set -e OP_EXPIRATION_TIME
end

function op_login_home
    set tok (op signin my --raw)
    if [ $status -eq 0 ]
      echo "Tight, you are logged in 😁"
      set -Ux OP_SESSION_my $tok
      set -U OP_EXPIRATION_TIME (date -v +30M -u +%s)
    else
      echo "1password login failed 😢" 1>&2
      return 2
    end
end
