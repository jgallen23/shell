#!/bin/bash

PROFILE=$1
if test -f $PROFILE.env; then
  ENV_FILE=$PROFILE.env
fi

docker run \
  --rm -it \
  --name shell-$PROFILE \
  -v shell-$PROFILE:/work \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME:$HOME \
  --workdir $HOME \
  --hostname $PROFILE \
  ${ENV_FILE:+ --env-file ${ENV_FILE}} \
  jgallen23/shell
