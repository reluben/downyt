wc -l list.txt ##how many lines there are in the text file
#I get rid of all lines that are not links in vim with this command :g!/^[hy]/d --> i.e. go to every line that does not start with 'h' or 'y' and delete it
	youtube-dl --sub-lang en --write-auto-sub --write-sub --embed-sub -f '18/http-832/worst' --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' -o "%(autonumber)s_%(id)s.%(ext)s" -a list.txt ##autonumbers them in case there is an order and adds their id - no title of video
ls *.{mp4,webm,mkv} > play.m3u ##all the videos that are generated are added to a playlist file
wc -l play.m3u ##displays how many videos were added to the playlist
echo "Done" ##lets the user know the script ended
