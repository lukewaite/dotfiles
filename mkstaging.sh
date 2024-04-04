#!/usr/bin/env bash

git branch -D $(git branch-name)_STAGING || true
git checkout staging && git pull && git checkout -
git checkout -b $(git branch-name)_STAGING
FIRST_COMMIT=$(git log origin/main..HEAD --no-merges --format=%H | wc -l | tr -d '[:blank:]')
git rebase -i HEAD~${FIRST_COMMIT}
git rebase -i origin/staging
