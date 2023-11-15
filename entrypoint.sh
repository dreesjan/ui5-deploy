#!/bin/sh -l

# BTP Deployment
if [ "$1" = "btp" ]
then
    echo $2
    echo $3
    echo $4
    echo $5
    # build the mta archive and deploy it to the BTP
    mbt build -p=cf -t mta_archives --mtar=app.mtar
    cf login -a $2 -o $3 -u $4 -p $5
    # cf install-plugin multiapps -f
    # cf install-plugin /root/multiapps-plugin.linux64 -f
    cf deploy ./mta_archives/app.mtar -f
    exit 0
else
    echo "Error: Please check deployment type!"
    exit 1
fi
