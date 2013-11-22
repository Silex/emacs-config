#!/bin/bash

for i in packages/*;
do
    remote_url=$(git --git-dir=$i/.git config remote.origin.url)
    git submodule add $remote_url $i
done
