#!/usr/bin/env bash



docker build . -t clientjar:1.0

export PATH="/home/daniel/.minishift/cache/oc/v3.6.0/linux:$PATH"
eval $(minishift oc-env)

oc login -u developer -pw developer
oc expose service docker-registry -n default
oc new-project test


docker tag clientjar 172.30.43.173:5000/test/clientjar



docker build . -t clientjar:1.0
docker push 172.30.43.173:5000/test/clientjar