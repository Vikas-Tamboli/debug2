#!/bin/bash

ACCESS_KEY="$1"
SECRET_KEY="$2"

filename="infra/.terraform"

if [ -d $filename ]
then
      exit
else
	cd infra
	terraform init -backend-config="a_key=$ACCESS_KEY" -backend-config="s_key=$SECRET_KEY"
	cd -
fi
