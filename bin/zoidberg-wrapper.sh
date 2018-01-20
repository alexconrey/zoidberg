#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export HUBOT_SLACK_TOKEN=$(cat $DIR/../.slack_creds)
export HUBOT_LOG_LEVEL="info"

cd $DIR/..
if [ ! -d ./logs ]; then
	mkdir ./logs
fi

if [ -f ./logs/zoidberg.log ]; then
	mv ./logs/zoidberg.log ./logs/zoidberg-$(date +'%Y%m%d%H%M%S').log
fi

./bin/hubot --adapter slack > logs/zoidberg.log 2>&1
