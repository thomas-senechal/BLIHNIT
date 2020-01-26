##
## Thomas SENECHAL PROJECT, 2020
## BLIHNIT
## File description:
## blihnit.sh is a small script created to init BLIH repository easily.
##

#!/bin/sh

CONFIG_PATH=$HOME/.config/blihnit.conf

if [ ! -f $CONFIG_PATH ]; then
    echo "Epitech email:"
    read BLIH_USER
    echo "Password:"
    read -s BLIH_PWD
    BLIH_TOKEN="`echo -n "$BLIH_PWD" | sha512sum | cut -f1 -d' '`"
else
    BLIH_USER=$(awk -F"=" '/^BLIH_USER/ { print $2 }' $CONFIG_PATH)
    BLIH_PWD=""
    BLIH_TOKEN=$(awk -F"=" '/^BLIH_TOKEN/ { print $2 }' $CONFIG_PATH)
fi

if [ $# -ge 1 ]; then
    REPO_NAME=$1
    echo "Create repository $REPO_NAME"
    blih -u $BLIH_USER -t $BLIH_TOKEN repository create $"$REPO_NAME"
    echo "Set ACL R to ramassage-tek"
    blih -u $BLIH_USER -t $BLIH_TOKEN repository setacl $"$REPO_NAME" ramassage-tek r
    while [ ! -z $2 ]; do
        blih -u $BLIH_USER -t $BLIH_TOKEN repository setacl $"$REPO_NAME" "$2@epitech.eu" wr
	    echo "Set ACL RW to: $2"
        shift
    done
    git clone git@git.epitech.eu:/$BLIH_USER/$"$REPO_NAME"
else
    echo "Error: no repository name."
fi
