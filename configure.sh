#!/bin/bash
echo "Enter the hour 0-23(* for every)"
read hour
echo "Enter the minute 0-59(* for every)"
read min
crontab -r
echo "$min $hour * * * ruby ${HOME}/ThePaperWall/Scripts/Wallpaper.rb" #>> tempfile
crontab tempfile
rm tempfile
echo "Your Wallpaper will be updated at $hour:$min"
echo "Be sure to have your Laptop On and Connected to the network"