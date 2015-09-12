require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'date'

URL= "http://www.thepaperwall.com"
#Finds the link to the Wallpaper of the day
page = Nokogiri::HTML(open(URL)) 
image = page.css("div.active a.mblock").attr("href").value
url = "#{URL}/#{image}"
#Gets The image link
page = Nokogiri::HTML(open(url))
image_link = page.css("img.wall_img").attr('src').value
url = "#{URL}#{image_link}" 
#Assigns a Timestamped name
temp = Time.now.strftime("%m-%d_%H-%M-%S")
path = "#{Dir.home}/ThePaperWall/Wallpapers/#{temp}.png"
#Saves The image
saver = Mechanize.new
puts "#{path}"
saver.get(url).save "Wallpaper.png"
#Makes the Wallpaper
system ("mv Wallpaper.png #{path}")
cmd = "gsettings set org.gnome.desktop.background picture-uri file://#{path}"
system ("#{cmd}")





