function goup
    set n (echo (basename $PWD))
    zellij attach "$n" 2>/dev/null || zellij --layout go --session="$n"
end

function sesh
    if test -f ./go.mod
        goup
    end
end
