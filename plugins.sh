#!/bin/bash

filename="infra/.terraform"

if [ -d $filename ]
then
      exit
else
 cd aws
 terraform init
 cd -
fi
