#!/bin/bash

if [ "$#" == "2" ]; then

    latest=`curl -s 'https://papermc.io/api/v1/paper/'$1 | jq '.builds.latest' | cut -d'"' -f2`

    wget 'https://papermc.io/api/v1/paper/'$1'/'$latest'/download' -O $2'/paper.jar'

else 

    clear

    echo "Paper Spigot Server JAR downloader"
    
    echo ""

    read -p "Enter valid server version: " version

    read -p "Enter directory to download: " folder

    command -v jq >/dev/null 2>&1 || sudo apt-get install jq -y

    latest=`curl -s 'https://papermc.io/api/v1/paper/'$version | jq '.builds.latest' | cut -d'"' -f2`

    wget 'https://papermc.io/api/v1/paper/'$version'/'$latest'/download' -O $folder'/paper.jar'

fi