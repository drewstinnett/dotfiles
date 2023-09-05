function goup
    set n (echo (basename $PWD))
    zellij attach "$n" 2>/dev/null || zellij --layout go --session="$n"
end

function sesh
    if test -f ./go.mod
        goup
    else
	zellij
    end
end

#if status is-interactive
    #if test -f ./go.mod
        #goup
    #else
        #eval (zellij setup --generate-auto-start fish | string collect)
    #end
#end
