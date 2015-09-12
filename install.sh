#!/bin/bash
#This script the necessary stuff for the wallpaper

mkdir -p ${HOME}/ThePaperWall/Scripts
mkdir -p ${HOME}/ThePaperWall/Wallpapers
ruby Wallpaper.rb
cp Wallpaper.rb ${HOME}/ThePaperWall/Scripts/

crontab -l > tempfile
echo "30 16 * * * ruby ${HOME}/ThePaperWall/Scripts/Wallpaper.rb" >> tempfile
crontab tempfile
rm tempfile

