#!/bin/bash

# Install PHP dependencies
composer install --prefer-dist --ignore-platform-reqs --no-dev

# Install front-end dependencies
npm install --production

# Remove all .git vendor directories
echo "Removing .git in vendor directory"
find vendor/ -type d -name ".git" -exec rm -rf {} \;
find vendor/ -type d -name ".gitignore" -exec rm -rf {} \;