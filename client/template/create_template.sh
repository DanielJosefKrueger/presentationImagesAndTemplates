#!/usr/bin/env bash



export PATH="/home/daniel/.minishift/cache/oc/v3.6.0/linux:$PATH"
export PATH=$PATH:/home/daniel/Schreibtisch/minishift
eval $(minishift oc-env)


oc login -u developer
oc project presentation

oc delete template clienttemplate
oc create -f client.json -n presentation
oc status -v