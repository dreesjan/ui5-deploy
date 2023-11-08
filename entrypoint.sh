#!/bin/sh

# BTP Deployment
if [ $1 -eq 'btp' ]
then
    # build the mta archive and deploy it to the BTP
    mbt build --mtar -p=cf -t ui5app.mtar
    cf login -a $2 -u $3 -p $4
    cf deploy ui5app.mtar -f
else
    echo "Please provide valid deployment type."
fi
