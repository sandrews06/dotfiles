#!/bin/sh

echo 'generate new ssh key'
ssh-keygen -t rsa -b 4096 -C $WORK_EMAIL
echo ~/.ssh/id_rsa | pbcopy
echo "Be sure to update github with the new ssh key.  It is copied to your clipboard."
