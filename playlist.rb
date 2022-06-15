require_relative 'song'
require_relative 'die'

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
            die = Die.new
            number_rolled = die.roll
            case number_rolled 
            when 5..6
                song.thumbs_up     
            when 3..4     
                puts "#{song.title} was skipped."    
            when 1..2
                song.thumbs_down                
            else # (nothing is added if die roll is 3 or 4... or 0 etc.)
            end
            puts song
        end
    end

end