#!/bin/bash

USERS_INFO=/root/addusers.txt
USERADD=/usr/sbin/useradd
PASSWD=/usr/bin/passwd
CUT=/bin/cut

while read LINES
do
    USERNAME=`echo $LINES | $CUT -f1 -d' '`
    PASSWORD=`echo $LINES | $CUT -f2 -d' '`
    # add user
    $USERADD $USERNAME
    if [ $? -ne 0 ]; then
        echo "$USERNAME exists, skip set password"
    else
        echo $PASSWORD | $PASSWD --stdin $USERNAME
    fi
done < $USERS_INFO