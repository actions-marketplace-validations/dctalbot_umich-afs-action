#!/bin/sh -l

set -eu

SSH_PATH="$HOME/.ssh"
mkdir "$SSH_PATH"

SSH_PRIVATE_KEY_PATH="$SSH_PATH/github_actions"
echo "$1" > "$SSH_PRIVATE_KEY_PATH"
chmod 600 "$SSH_PRIVATE_KEY_PATH"

echo "Hello $2"
echo "Hello $3"
# rsync -r --delete $2 $3
rsync -r --delete -e "ssh -p $RSYNC_PASSWORD -i $SSH_PRIVATE_KEY_PATH -o StrictHostKeyChecking=no" $2 $3
# sh -c "rsync -r --delete -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' $2 $3"

time=$(date)
echo "::set-output name=time::$time"
