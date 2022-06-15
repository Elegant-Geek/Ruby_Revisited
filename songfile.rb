#SONGFILE
#RUN THIS ONE
#(File created 9:47PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - ....  11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1AM  6/14/22 

require_relative 'playlist' # calls the playlist class file 
require_relative 'song' # calls the song class file 
require_relative 'die'
# (technically require_relative 'song' isnt needed here as well since it is referenced within the playlist file already)


song1 = Song.new("In the Flesh?", 100)
song2 = Song.new("Vera", 200)
song3 = Song.new("Comfortably Numb", 300)

my_list = Playlist.new("Jamie's Pink Floyd Playlist")
my_list.add_song(song1)
my_list.add_song(song2)
my_list.add_song(song3)
my_list.play


