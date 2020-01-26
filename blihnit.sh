#!/bin/sh

BLIH_USER="@epitech.eu"
BLIH_PWD=""
BLIH_TOKEN="`echo -n "$BLIH_PWD" | sha512sum | cut -f1 -d' '`"

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
