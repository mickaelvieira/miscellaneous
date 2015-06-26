#!/bin/bash

SRC_DIR=
DEST_DIR=
REPO_URI=

git clone --verbose \
            --depth=1 \
            --single-branch \
            --branch master "${REPO_URI}" "${TMP_DIR}"

rsync --verbose \
    --times \
    --owner \
    --group \
    --recursive \
    --update \
    --delete-before \
    --exclude .git/ \
    --exclude .gitignore "${SRC_DIR}/" "${DEST_DIR}/"

