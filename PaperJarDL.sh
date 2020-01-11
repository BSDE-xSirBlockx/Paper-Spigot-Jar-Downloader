#!/bin/bash

command -v jq >/dev/null 2>&1 || sudo apt-get install jq -y

if [ "$#" == "2" ]; then

    if [ $1 = "waterfall" ] || [ $1 = "travertine" ]; then

        version=`curl -s 'https://papermc.io/api/v1/'$1'/' | jq '.versions[0]' | cut -d'"' -f2`

        latest=`curl -s 'https://papermc.io/api/v1/'$1'/'$version | jq '.builds.latest' | cut -d'"' -f2`

        wget 'https://papermc.io/api/v1/'$1'/'$version'/'$latest'/download' -O $2'/'$1'.jar'

    else 

        latest=`curl -s 'https://papermc.io/api/v1/paper/'$1 | jq '.builds.latest' | cut -d'"' -f2`

        wget 'https://papermc.io/api/v1/paper/'$1'/'$latest'/download' -O $2'/paper.jar'

    fi
else 

    clear

    echo "Paper JAR downloader"
    
    echo ""

    read -p "Paper Spigot[paper] / Waterfall[waterfall] / Travertine[travertine] " jar

    read -p "Enter directory to download: " folder

    if [ $jar = "waterfall" ] || [ $jar = "travertine" ]; then

        version=`curl -s 'https://papermc.io/api/v1/'$jar'/' | jq '.versions[0]' | cut -d'"' -f2`

        latest=`curl -s 'https://papermc.io/api/v1/'$jar'/'$version | jq '.builds.latest' | cut -d'"' -f2`

        wget 'https://papermc.io/api/v1/'$jar'/'$version'/'$latest'/download' -O $folder'/'$jar'.jar'

    else 

        read -p "Enter valid server version: " version

        latest=`curl -s 'https://papermc.io/api/v1/paper/'$version | jq '.builds.latest' | cut -d'"' -f2`

        wget 'https://papermc.io/api/v1/paper/'$version'/'$latest'/download' -O $folder'/paper.jar'
    fi
fi