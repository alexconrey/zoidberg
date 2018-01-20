#!/bin/bash

if [ -f .deploy_rsa ]; then
	chmod 600 .deploy_rsa
	ssh -l zoidberg -i .deploy_rsa 18.218.12.219 "cd /opt/zoidberg && git pull && npm install && sudo service zoidberg restart" 
fi
