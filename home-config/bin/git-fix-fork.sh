#!/usr/bin/env bash

## This fixes situations where pulling from the upstream master
## always results in new merge commits, polluting PRs with a huge
## list of commits.

## NOTE: this will destroy any commits on the origin master branch
## that are ahead of the upstream master branch
git checkout master
git fetch upstream
git reset --hard upstream/master
git clean -f -d
git push -f origin master
