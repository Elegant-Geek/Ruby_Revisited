#SONGFILE
#RUN THIS ONE
#(File created 9:47PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - ....  11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1AM  6/14/22 
#day five is 12:45pm - 1:30pm before work 6/15/22 
#day six is 12am -  6/18/22 

require_relative 'playlist' # calls the playlist class file 
require_relative 'song' # calls the song class file 
require_relative 'die'
# (technically require_relative 'song' isnt needed here as well since it is referenced within the playlist file already)


song1 = Song.new("In the Flesh?", 2) 
song2 = Song.new("Vera", 3) # big numbers means it is ranked lowest
song3 = Song.new("Hey You", 4) # big numbers means it is ranked lowest
song4 = Song.new("Run Like Hell", 5) # big numbers means it is ranked lowest
song5 = Song.new("Comfortably Numb", 1) # small numbers means it is ranked highest

my_list = Playlist.new("Jamie's Pink Floyd Playlist")
my_list.add_song(song1)
my_list.add_song(song2)
my_list.add_song(song3)
my_list.add_song(song4)
my_list.add_song(song5)

my_list.play(3) # currently my games have the order staying the same with small game round values. 

my_list.print_stats


