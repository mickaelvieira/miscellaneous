#!/bin/bash

SITE_REPO="."

COMPOSER_DIR="${SITE_REPO}/vendor"
BOWER_DIR="${SITE_REPO}/public_html/vendor"
NODE_DIR="${SITE_REPO}/node_modules"

echo "==========================================================================="
echo "Composer: ${COMPOSER_DIR}"
echo "Bower   : ${BOWER_DIR}"
echo "Node    : ${NODE_DIR}"
echo "==========================================================================="

cd ${SITE_REPO}

read -e -p "Do you want to create a new branch? [y/N]: " confirminfo

if [[ ${confirminfo} == "y" ]]; then

    echo ""
    read -e -p "Branch name?: " branchname

    if [[ ${branchname} == "" ]]; then
        echo "You need to provide a branch name"
        exit 1
    fi

    read -e -p "Create a branch with the name ${branchname}? [y/N]: " confirminfo

    if [[ ${confirminfo} == "y" ]]; then
        git checkout master
        git checkout -b ${branchname}
    fi
fi

read -e -p "Do you want to install/reinstall the PHP libraries? [y/N]: " confirminfo

if [[ ${confirminfo} == "y" ]]; then
    if [[ -d ${COMPOSER_DIR} ]]; then
        rm -rf ${COMPOSER_DIR}
    fi
    composer install
fi

read -e -p "Do you want to install/reinstall the Node libraries? [y/N]: " confirminfo

if [[ ${confirminfo} == "y" ]]; then
    if [[ -d ${NODE_DIR} ]]; then
        rm -rf ${NODE_DIR}
    fi
    npm install
fi

read -e -p "Do you want to install/reinstall the Bower assets? [y/N]: " confirminfo

if [[ ${confirminfo} == "y" ]]; then
    if [[ -d ${BOWER_DIR} ]]; then
        rm -rf ${BOWER_DIR}
    fi
    bower install
fi




