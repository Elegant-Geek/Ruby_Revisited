require_relative 'song'

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
        @list.each do |song|
            puts song
            song.thumbs_up
            song.thumbs_up
            song.thumbs_down
            song.thumbs_up
            puts song
        end
    end

end