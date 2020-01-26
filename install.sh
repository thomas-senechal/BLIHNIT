##
## Thomas SENECHAL PROJECT, 2020
## BLIHNIT
## File description:
## install.sh
##

#!/bin/sh

if [ $EUID != 0 ]; then
    sudo cp blihnit.sh /usr/bin/blihnit
else
    cp blihnit.sh /usr/bin/blihnit
fi

if [ $# -ge 1 ]; then
    ARG=$1
    if [[ ${ARG:0} == "-n" ]]; then
        exit 0
    fi
fi

CONFIG_PATH=$HOME/.config/blihnit.conf

echo "Epitech email:"
read BLIH_USER
if [ ! -z "$BLIH_USER" ]; then
    echo "BLIH_USER=$BLIH_USER" > $CONFIG_PATH
fi

echo "Password:"
read -s BLIH_PWD
if [ ! -z "$BLIH_PWD" ]; then
    BLIH_TOKEN="`echo -n "$BLIH_PWD" | sha512sum | cut -f1 -d' '`"
    echo "BLIH_TOKEN=$BLIH_TOKEN" >> $CONFIG_PATH
fi

echo "blihnit.conf has been init in ~/.config/"
