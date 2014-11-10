#! /bin/bash

# This script takes as input the name of the tv show, season,the range of episodes to download and the name of the video site to download

# Syntax ./watchSeriesGen.sh [tv show name] [season number] [episode range begin] [episode range end] [name of the video sites whose urls are to be generated enclosed in a quoted string]

# Author: Abhay Mittal

tvShowName=$1
seasonNo=$2
epInit=$3
epFinal=$4
vidSites=$5

echo "========================================"
echo "The input parameters are: "
echo "TV Show Name    = $tvShowName"
echo "Season Number   = $seasonNo"
echo "Initial episode = $epInit"
echo "Final episode   = $epFinal"
echo "Video sites      = $vidSites"
echo "========================================"

baseUrl=$(echo "http://watchseries.ag/episode/${tvShowName}_s${seasonNo}_e");

for ((ep=epInit; ep <= epFinal ; ep++))
do
    # Grab the link of the secondary page
    echo "Episode $ep";
    pageUrl=$(echo "$baseUrl$ep.html")
    pageSource=$(curl -s "$pageUrl")
    linkTable=$(echo "$pageSource" | xmllint --html --xpath '//div[@id="lang_1"]/div[@class="linktable"]/table/tbody/tr' - 2> /dev/null)

    for vidSite in $vidSites
    do
	linkPage=$(echo "$linkTable" | xmllint --html --xpath "string(//a[@title=\"$vidSite\" and @class=\"buttonlink\"]/@href)" - 2> /dev/null)
	linkNum=$(echo "$linkPage" | rev | cut -d/ -f1 | rev)
	linkPage=$(echo "http://watchseries.ag/open/cale/$linkNum")
	# Now grab the video site link from the link page
	pageSource=$(curl -s "$linkPage")
	vidLink=$(echo "$pageSource" | xmllint --html --xpath 'string(//a[@class="myButton"]/@href)' - 2> /dev/null)
	echo $vidLink	
    done
    echo "----------------------------------------------------"
done

