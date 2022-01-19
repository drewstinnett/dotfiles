function op_login
    set -Ux OP_SESSION_dukeu (op signin dukeu --raw)
    set -U OP_EXPIRATION_TIME (date -v +30M -u +%s)
end
function op_logout
    set -e OP_SESSION_dukeu
    set -e OP_EXPIRATION_TIME
end
