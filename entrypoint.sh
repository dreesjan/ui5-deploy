#!/bin/sh -l

# BTP Deployment
if [ "$1" = "btp" ]
then
    # build the mta archive and deploy it to the BTP
    mbt build -p=cf -t mta_archives --mtar=ui5app.mtar
    cf login -a $2 -o $3 -u $4 -p $5
    cf install-plugin multiapps -f
    cf deploy ./mta_archives/ui5app.mtar -f
    exit 0
else
    echo "Please provide valid deployment type."
    exit 1
fi
