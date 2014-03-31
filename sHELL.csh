#!REAL_SHELL
if ( `whoami` == "root" ) then
    set sign = "#"
else
    set sign = '$'
endif
set prompt = "`whoami`@[s]HELL$sign "
onintr interr
echo "Welcome to [s]HELL... Good luck"
set i = 0
interr:
while ( 1 )
    echo -n "$prompt "
    set cmd = "$<"
    if ( `echo $cmd | cut -d " " -f 1` != 'please' && "$cmd" != "" ) then
        @ i++
        if ( $i > 6 ) then
            echo "Say please. SAY PLEASE."
        endif
        echo "I'm afraid I can't do that $USER"
    else if ( `echo $cmd | awk '{print substr($0,8)}'` != '' && "$cmd" != "" ) then
        set i = 0
        if (`echo $cmd | grep kill` != "" ) then
            echo 'Cant kill me'
        else if ( `echo $cmd | egrep "\W?(ba|c|z|k)?sh"` != "" ) then
            echo 'What? This shell isnt good enough for you, bro?'
        else if ( `echo $cmd | grep vim` != "" ) then
            echo 'Vim is nice... but you cant use it'
        else if ( `echo $cmd | grep python  || echo $cmd | grep perl` != "" ) then
            echo 'No system calls in here'
        else
            echo $cmd | awk '{print substr($0,8)}' | REAL_SHELL 2>&1 | egrep -v 'grep|\W?(ba|c|z|k)?s(h|H)'
            onintr interr
        endif
    endif
end

