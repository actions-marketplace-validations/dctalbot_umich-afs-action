#!/bin/sh -l

echo "Hello $1"
echo "Hello $2"
rsync -r --delete $1 $2
time=$(date)
echo "::set-output name=time::$time"
