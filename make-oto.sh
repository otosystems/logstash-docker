#!/bin/bash
pip install awscli
eval $(aws ecr get-login --no-include-email --region us-east-1)
export REPO=logstash-docker
export REGISTRY=$AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com
export IMAGE_TAG=$REGISTRY/$REPO
ELASTIC_VERSION=$VERSION IMAGE_FLAVORS=full make IMAGE_TAG=$IMAGE_TAG
docker push $IMAGE_TAG:$VERSION
