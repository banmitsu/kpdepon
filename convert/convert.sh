#!/bin/sh
for file in `ls ../clips/*.wav`
do
    fname=`basename $file | cut -d '.' -f1`
    rm -f $fname.mp3 $fname.ogg
    ffmpeg -loglevel panic -i ../clips/$fname.wav -acodec libvorbis -ac 1 -ab 48k $fname.ogg
    ffmpeg -loglevel panic -i ../clips/$fname.wav -acodec libmp3lame -ac 1 -ab 48k $fname.mp3
done
