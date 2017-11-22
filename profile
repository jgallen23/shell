#!/bin/bash

if test -z $PROFILE; then
  PROFILE=$1
fi
if test -f $PROFILE.env; then
  ENV_FILE=$PROFILE.env
fi
if test -f shell.env; then
  GLOBAL_ENV=shell.env
fi

docker inspect shell-$PROFILE > /dev/null
if [[ "$?" == 1 ]]; then
  docker run \
    -d \
    -it \
    --name shell-$PROFILE \
    --env PROFILE_NAME=$PROFILE \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.ssh:/ssh \
    -v /work/$PROFILE:/work/$PROFILE \
    --workdir /work/$PROFILE \
    --hostname $PROFILE \
    ${ENV_FILE:+ --env-file ${ENV_FILE}} \
    ${GLOBAL_ENV:+ --env-file ${GLOBAL_ENV}} \
    gregallen/shell
  sleep 1
fi

docker exec -it shell-$PROFILE sh -c "tmux at -t dev || tmux new -s dev"
