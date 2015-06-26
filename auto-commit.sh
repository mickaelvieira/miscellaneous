#!/bin/bash

REMOTE_URL=$(git config remote.origin.url)
EXPECTED_URL=

git status

if [[ "${REMOTE_URL}" = "${EXPECTED_URL}" ]] ; then

    git add -A .
    git commit -m "Auto-committing build result"
    git push origin master

fi