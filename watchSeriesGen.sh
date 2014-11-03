#! /bin/bash

#This script takes as input the name of the tv show, season,the range of episodes to download and the name of the video site to download

# Syntax ./watchSeriesGen.sh [tv show name] [season number] [episode range begin] [episode range end] [name of the video site whose urls are to be generated]

#Author: Abhay Mittal

tvShowName=$1
seasonNo=$2
epInit=$3
epFinal=$4
vidSite=$5

echo "The input parameters are: "
echo "TV Show Name = $tvShowName"
echo "Season Number = $seasonNo"
echo "Initial episode = $epInit"
echo "Final episode = $epFinal"
echo "Video site = $vidSite"

baseUrl=$(echo "http://watchseries.ag/episode/${tvShowName}_s${seasonNo}_e");

for ((ep=epInit; ep <= epFinal ; ep++))
do
    pageUrl=$(echo "$baseUrl$ep.html")
    pageSource=$(curl "$pageUrl")
    linkTable=$(echo "$pageSource" | xmllint --html --xpath '//div[@id="lang_1"]/div[@class="linktable"]/table/tbody/tr' - 2> /dev/null)
    echo "$linkTable"
done

