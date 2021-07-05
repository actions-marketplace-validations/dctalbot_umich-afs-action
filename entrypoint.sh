#!/bin/sh -l

set -eu

rsync -r --delete -e "sshpass -e ssh -o StrictHostKeyChecking=no" $GITHUB_WORKSPACE/. $UNIQNAME@login.itd.umich.edu:./Public/html/
