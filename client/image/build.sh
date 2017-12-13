#!/usr/bin/env bash
VERSION=1.0
IMAGE_NAME=clientjar

echo "start build local $IMAGE_NAME:$VERSION"
docker build . -t clientjar:1.0

export PATH="/home/daniel/.minishift/cache/oc/v3.6.0/linux:$PATH"
export PATH=$PATH:/home/daniel/Schreibtisch/minishift
eval $(minishift oc-env)



echo "start build $IMAGE_NAME:$VERSION"

echo "set minishift environment"
minishift docker-env
eval $(minishift docker-env)

echo "build image"
docker build . -t $IMAGE_NAME:$VERSION

echo "tag image"
docker tag $IMAGE_NAME:$VERSION $(minishift openshift registry)/presentation/$IMAGE_NAME:$VERSION


echo "login as developer"
oc login -u developer
oc project presentation

docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)

echo "push image into minishift repo"
docker push $(minishift openshift registry)/presentation/$IMAGE_NAME:$VERSION


echo "done"





