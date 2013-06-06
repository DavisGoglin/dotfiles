#!/bin/bash
#Usage: $0
#Gets a list of files in ./wallpaper, then displays a random on one the first
#two montors using "feh"

#shopt -s nullglob

if [ x$DISPLAY == x ] ; then
	exit;
fi

cd ~/.wallpaper

for i in *.jpg *.png; do
	[[ -f $i ]] && files+=("$i")
done

range=${#files[@]}

((range)) && DISPLAY=:0.0 feh --bg-scale "${files[RANDOM % range]}" "${files[RANDOM % range]}"
