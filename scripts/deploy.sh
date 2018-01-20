#!/bin/bash

if [ -f .deploy_rsa ]; then
	chmod 600 .deploy_rsa
	echo "Pulling latest ${TRAVIS_BRANCH} on remote host"
	ssh -l zoidberg -i .deploy_rsa 18.218.12.219 "touch `date +'%Y%m%d%H%M%S'`"
	ssh -l zoidberg -i .deploy_rsa 18.218.12.219 "cd /opt/zoidberg && git pull"
	echo "Installing new npm pkgs on remote host"
	ssh -l zoidberg -i .deploy_rsa 18.218.12.219 "cd /opt/zoidberg && npm install"
	echo "Restarting zoidberg service on remote host"
	ssh -l zoidberg -i .deploy_rsa 18.218.12.219 "sudo service zoidberg stop; sleep 1; sudo service zoidberg start" 
fi
