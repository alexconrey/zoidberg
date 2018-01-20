#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export HUBOT_SLACK_TOKEN="$1"
export HUBOT_LOG_LEVEL="info"

cd $DIR/..
if [ ! -d $DIR/../logs ]; then
	mkdir $DIR/../logs
fi
./bin/hubot --adapter slack > logs/zoidberg.log 2>&1
