
This script takes as input the name of the tv show, season,the range of episodes to download and the name of the video sites and generates the links of the video sites.

##Author
Abhay Mittal

##Syntax

```./watchSeriesGen.sh [tv show name] [season number] [episode range begin] [episode range end] [name of the video sites whose urls are to be generated enclosed in double quotes]```

Note: TV Show name has to be from the series URL
like in the link watchseries.lt/serie/numb3rs, the tv show name will be numb3rs
Thus to get movshare and videoweed links of initial 10 episodes of season 5 of numb3rs the command will be

```./watchSeriesGen.sh numb3rs 5 1 10 "movshare videoweed"```