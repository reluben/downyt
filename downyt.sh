#!/bin/bash
#interactive youtube-dl script

##throughout the script I chose to use else statments since defaulting to those options is ideal (I'm using a toaster)
##thefore instead of entering something one can simply hit enter
##Additionally, one can change the qualities in the script as they please. Best instead of worst, for example.

#If you'd like to search for a video choose "2" otherwise choose "1" or simply press enter
read -p "(1) URL or (2) Search? " SEARCH
if [ $SEARCH == 2 ]; then
	read -p "Enter video title: " TITLE
	youtube-dl --sub-lang en --write-auto-sub --write-sub --embed-sub -f '22/worst' --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' "ytsearch:$TITLE"
  
else #goes here if you did not choose option "2"

	echo "Enter URL: "
	read -p "For links in text file type -a filename.txt" URL
	read -p "Rename file?" RENAME
	if [ $RENAME == y ]; then
    #used mostly for Twitter videos where the name is too long hence no option for video quality
		youtube-dl -f '22/worst' --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' --id $URL
    
	else
  
		read -p "(1)High\(2)Low\(3)Audio" QUALITY
		if [ $QUALITY -eq 3 ]; then
			echo "You chose audio"
			echo "Would you like to convert to mp3? y/N"
			read yesno
			if [ $yesno == y ]; then
				youtube-dl -f 'bestaudio' -x --audio-format mp3 $URL
				else
				youtube-dl -f 'bestaudio' $URL
			fi 
      
		elif [ $QUALITY -eq 2 ]; then 
			echo "Low Quality Video"
			youtube-dl --write-annotations --write-auto-sub --add-metadata --write-sub --sub-lang en --embed-sub -f '18/worstvideo+worstaudio' $URL
		
    else
			echo "High Quality Video"
			youtube-dl --write-annotations --write-auto-sub --add-metadata --write-sub --sub-lang en --embed-sub -f '302+bestaudio/298+bestaudio/22/best' $URL
		fi 
	fi 
fi
