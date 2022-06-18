require_relative 'song'
require_relative 'die'
require_relative 'playlist_turn'

class Playlist
    attr_reader :name          #you can read the title (name) of the playlist
    def initialize(name)       #this method converts a Playlist.new specified title to the correct format when created
        @name = name.upcase    #upcased all playlist titles for now
        @list = []
        puts "Playlist '#{@name}' was created."
    end

    def add_song(song)
        @list << song 
    end

    def play
        puts "There are #{@list.size} songs in this playlist:"
        @list.each do |song|
            puts "#{@list.index(song) + 1}) #{song.title}"
        end
        # puts "number rolled is #{number_rolled}"
        @list.each do |song|
            puts song
            PlaylistTurn.take_turn(song)
            puts song
        end
    end

end