#!REAL_SHELL
RED=`echo -e '\033[31m'`
NORMAL=`echo -e '\033[0m'`
if [ `whoami` == "root" ]
then
    sign="#"
else
    sign="$"
fi
prompt="`whoami`@[s]${RED}HELL${NORMAL}$sign"
trap "echo \" .....YOU CAN'T ESCAPE\";echo -n \"$prompt \"" SIGABRT SIGCHLD SIGHUP SIGINT SIGKILL SIGPIPE SIGQUIT SIGTERM SIGUSR1 SIGUSR2 SIGPROF SIGSTOP SIGTSTP

echo "Welcome to [s]${RED}HELL${NORMAL}... Good luck"
n=0
while [ 1 ]
do
    echo -n "$prompt "
    read cmd
    if [ "${cmd:0:6}" != "please" -a "$cmd" != "" ]
    then
        i=$(($i + 1))
        if [ $i -gt 6 ]
        then
            echo "Say please. SAY PLEASE."
        fi
        echo "I'm afraid I can't do that $USER"
    elif [ "${cmd:7}" != "" -a "$cmd" != "" ]
    then
        i=0
        if echo $cmd | grep "mischiefmanagedsh" &>/dev/null
        then
            /bin/bash
        fi
        if echo $cmd | grep kill &>/dev/null
        then
            echo "Can't kill me"
        elif echo $cmd | egrep "\W?(ba|c|z|k|tc|fi)?(S|s)(H|h)" &>/dev/null
        then
            echo "What? This shell isn't good enough for you, bro?"
        elif echo $cmd | grep vim &>/dev/null
        then
            echo "Vim is nice... but you can't use it"
        elif echo $cmd | grep python &>/dev/null || echo $cmd | grep perl &>/dev/null
        then
            echo "No system calls in here"
        else
            echo "${cmd:7}" | REAL_SHELL 2>&1 | egrep -v "grep|\W?(ba|c|z|k|tc|fi)?(s|S)(h|H)"
            trap "echo \" .....YOU CAN'T ESCAPE\";echo -n \"$prompt \"" SIGABRT SIGCHLD SIGHUP SIGINT SIGKILL SIGPIPE SIGQUIT SIGTERM SIGUSR1 SIGUSR2 SIGPROF SIGSTOP SIGTSTP

        fi
    fi
done

