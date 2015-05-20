#!/bin/bash

SITE_REPO="."

carry_on() {

    echo ""
    read -e -p "Do you want to carry on? [Y/n]: " confirminfo

    if [[ ${confirminfo} == "n" ]]; then
        echo "Interrupted!"
        exit
    fi
}


cd ${SITE_REPO}

echo -e "======================================================================="
echo -e "                           PHP Code Sniffer                            "
echo -e "======================================================================="

./bin/phpcs --standard=PSR2 ./protected/library/

carry_on

echo -e ""
echo -e "======================================================================="
echo -e "                               PHPSpec                                 "
echo -e "======================================================================="

./bin/phpspec run --format=pretty

carry_on

echo -e ""
echo -e "======================================================================="
echo -e "                                JSHint                                 "
echo -e "======================================================================="

gulp jshint

carry_on

echo -e ""
echo -e "======================================================================="
echo -e "                            JS Code Sniffer                            "
echo -e "======================================================================="

gulp jscs

carry_on

echo -e ""
echo -e "======================================================================="
echo -e "                                Jasmine                                "
echo -e "======================================================================="

gulp test

echo -e "\nDone!"
