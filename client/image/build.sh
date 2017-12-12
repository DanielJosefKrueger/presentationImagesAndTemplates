#!/usr/bin/env bash



docker build . -t clientjar:1.0

export PATH="/home/daniel/.minishift/cache/oc/v3.6.0/linux:$PATH"
eval $(minishift oc-env)

docker build . -t clientjar:1.0