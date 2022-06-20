#SONGFILE
#RUN THIS ONE
#(File created 9:47pm on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - ....  11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1am  6/14/22 
#day five is 12:45pm - 1:30pm before work 6/15/22 
#day six is 12am - 7:05pm 7 hours straight 6/18/22 
#day seven is 4:30pm - 8:15pm and 10pm - 12:30am 6/19/22 

require_relative 'playlist' # calls the playlist class file 
require_relative 'song' # calls the song class file 
require_relative 'die'
require_relative 'council'

# (technically require_relative 'song' isnt needed here as well since it is referenced within the playlist file already)

song1 = Song.new("In the Flesh?", 100) 
song2 = Song.new("Vera", 200) # big numbers means it is ranked lowest
song3 = Song.new("Hey You", 300) # big numbers means it is ranked lowest
song4 = Song.new("Run Like Hell", 400) # big numbers means it is ranked lowest
song5 = Song.new("Comfortably Numb", 500) # small numbers means it is ranked highest
song6 = Song.new("Pigs on the Wing", 600)
song7 = Song.new("Another Brick in the Wall", 700)
song8 = Song.new("Is there anybody out there?", 800)
song9 = Song.new("The Trial", 900)
song10 = Song.new("Stop", 1000)
song11 = Song.new("Young Lust", 1100)
my_list = Playlist.new("Jamie's Pink Floyd Playlist")

[song1, song2, song3, song4, song5, song6, song7, song8, song9, song10, song11].each do |song| # "don't repeat yourself"
    my_list.add_song(song)
end

my_list.play(5) # currently my games have the order staying the same with small game round values. 

my_list.print_stats # currently, this must be called SEPARATELY, not from within the "play" method to get the tests to pass

my_list.show_titles # shows titles in the "array" format using "p"


