#!/bin/sh -l

set -eu

SSH_PATH="$HOME/.ssh"
mkdir "$SSH_PATH"

SSH_KEY_PATH="$SSH_PATH/github_actions"
echo "$1" > "$SSH_KEY_PATH"
chmod 600 "$SSH_KEY_PATH"

rsync -r --delete -e "sshpass -e ssh -i $SSH_KEY_PATH -o StrictHostKeyChecking=no" $GITHUB_WORKSPACE/. $3

time=$(date)
echo "::set-output name=time::$time"
