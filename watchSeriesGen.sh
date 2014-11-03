#! /bin/bash

#This script takes as input the name of the tv show, season,the range of episodes to download and the name of the video site to download

# Syntax ./watchSeriesGen.sh [tv show name] [season number] [episode range begin] [episode range end] [name of the video site whose urls are to be generated]

#Author: Abhay Mittal

tv_show_name=$1
season_no=$2
ep_init=$3
ep_final=$4
vid_site=$5

base_url="http://watchseries.ag/episode/_s$season_no_e";
