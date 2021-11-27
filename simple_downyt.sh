read -p "(1) Video or (2) Audio? " FORMAT
if [ $FORMAT == 1 ]; then
	wc -l list.txt # how many lines there are in the text file
	yt-dlp --sub-lang en --write-auto-sub --embed-sub -f '22+bestaudio/http-832/worst' -o "%(autonumber)s_%(title)s_%(id)s.%(ext)s" -a list.txt
	ls *.{mp4,mkv,webm} > play.m3u #all the videos that are generated are added to a playlist file
	wc -l play.m3u #displays how many videos were added to the playlist
	echo "~*~*~*~*Done" #lets the user know the script ended
else
	wc -l list.txt # how many lines there are in the text file
	yt-dlp -f 'bestaudio' -x --audio-format mp3 -o "%(title)s_%(id)s.%(ext)s" -a list.txt
	ls *.mp3 > music.m3u #all the songs that are generated are added to a playlist file
	wc -l music.m3u #displays how many songs were added to the playlist
	echo "~*~*~*~*Done" #lets the user know the script ended
fi
