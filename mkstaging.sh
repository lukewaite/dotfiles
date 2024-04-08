#!/usr/bin/env bash

git branch -D $(git branch-name)_STAGING || true
git checkout staging && git pull && git checkout -
git checkout -b $(git branch-name)_STAGING
FIRST_PARENT=$(diff -u <(git rev-list --first-parent $(git branch-name)) <(git rev-list --first-parent main) |  sed -ne 's/^ //p' | head -1)
git rebase -i ${FIRST_PARENT}
git rebase -i origin/staging
