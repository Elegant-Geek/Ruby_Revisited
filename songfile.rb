#(File created 9:47pm on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - ....  11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1am  6/14/22 
#day five is 12:45pm - 1:30pm before work 6/15/22 
#day six is 12am - 7:05pm 7 hours straight 6/18/22 
#day seven is 4:30pm - 8:15pm and 10pm - 12:30am 6/19/22 
#day eight is 8:55pm - 11:45pm 6/20/22 
#day nine is 11:47pm - 5:34AM!! 6/22/22 (night)
#day ten is 8:08pm - ! 6/22/22 (day)

require_relative 'playlist' # calls the playlist class file 
require_relative 'song' # calls the song class file 
require_relative 'die'
require_relative 'council'
require_relative 'classic_song'

# (technically require_relative 'song' isnt needed here as well since it is referenced within the playlist file already)

my_list = Playlist.new("Jamie's Pink Floyd Playlist")
my_list.load_songs(ARGV.shift || "THE_WALL.csv") #plays an entered file OR the default (WALL.csv)
classic_song = ClassicSong.new("Time") #default rank of 10000 assigned bc not specified, then halved bc it is a ClassicSong
my_list.add_song(classic_song)

loop do
    puts "\nHow many rounds? ('quit' to exit)"
    ans = gets.chomp.downcase

    case ans
    when /^\d+$/
        if ans.to_i > 20
            puts "ERROR: Maximum number of rounds allowed: 20." # I will set a limit to 20 rounds
        else
        my_list.play(ans.to_i) # converts to integer
        end
    when 'quit', 'exit', 'q', 'e', 'ex'
        my_list.print_stats # currently, this must be called SEPARATELY, not from within the "play" method to get the tests to pass
        break
    else
        puts "Please enter a number or 'quit'"
    end
end

my_list.save_output #this goes after the loop

# my_list.show_titles 
# ^ shows titles in the "array" format using "p"



