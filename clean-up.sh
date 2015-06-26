#!/bin/bash

git reset --hard HEAD
git clean -d -x -f
git fetch origin
git checkout master
git status