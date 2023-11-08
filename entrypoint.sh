#!/bin/sh -l

echo $1

# BTP Deployment
if [ "$1" = "btp" ]
then
    # build the mta archive and deploy it to the BTP
    mbt build --mtar -p=cf -t ui5app.mtar
    cf login -a $2 -u $3 -p $4
    cf deploy ui5app.mtar -f
    exit 0
else
    echo "Please provide valid deployment type."
    exit 1
fi
