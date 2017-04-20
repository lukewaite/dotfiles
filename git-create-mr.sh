#!/usr/bin/env bash

remoteName=${1:-origin}
branch=`git rev-parse --abbrev-ref HEAD`

remote=`git remote -v | grep "(push)$" | grep $remoteName`
regex="origin[[:space:]]+git@([A-Za-z\.]+)[\:|\/](.*)/(.*).git"

if [[ $remote =~ $regex ]]; then
    server=${BASH_REMATCH[1]}
    group=${BASH_REMATCH[2]}
    project=${BASH_REMATCH[3]}
else
    echo "error: unsupported remote"
    exit 1
fi


target="master"

if [[ "$branch" == *STAGING ]]; then
    target="staging"
fi

if [[ "$server" == github.com ]]; then
    open "https://$server/$group/$project/compare/$target...$branch"
else
    open "https://$server/$group/$project/merge_requests/new?merge_request%5Bsource_branch%5D=$branch&merge_request%5Btarget_branch%5D=$target"
fi