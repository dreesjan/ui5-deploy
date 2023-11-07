#!/bin/sh

if [ $1 == 'btp' ]
then
    mbt build --mtar -p=cf -t ui5app.mtar
    cf login -a $2 -u $3 -p $4
    cf deploy ui5app.mtar -f
else
    echo "Please provide valid deployment type."
fi
