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

    def add_song(song) #when you add a song, the list re-sorts itself
        @list << song 
        @list = @list.sort { |a, b| a.rank <=> b.rank }
    end

    def preview #created this method... it looks very similar to the print_stats method
        puts "There are #{@list.size} songs in this playlist:"
        @list.each do |song|
            @list.sort { |a, b| a.rank <=> b.rank }
            song.rank = @list.index(song) + 1
            puts "#{song.rank}) #{song.title}"
            end
    end

    def play(rounds=1) #play one round by default

        self.preview #use of SELF to call preview on the applicable Playlist object from inside the play method

        1.upto(rounds) do |round|
            puts "\nRound #{round}:"
        # puts "number rolled is #{number_rolled}"
            @list.each do |song|
                puts song
                PlaylistTurn.take_turn(song)
                puts song
            end
        end
    end

    def print_stats
      
            puts "\n#{@name}"
            @list.each do |song|
            @list.sort { |a, b| a.rank <=> b.rank }
            song.rank = @list.index(song) + 1
            formatted_name = song.title.ljust(20, '.')
            puts "#{formatted_name} #{song.rank}"
            end

            top_ten_songs, average_songs = @list.partition { |song| song.top_ten? }

        puts "\n#{@name}"

        puts "\nTop 10 Songs:" unless top_ten_songs.empty?
        top_ten_songs.each do |song|
          puts "#{song.rank}) #{song.title}"
        end

        if top_ten_songs.empty? # likely will never happen unless pre-ranked is turned off and all rank inputs are > 10
            puts "\nSongs:"
            average_songs.each do |song|
              puts "#{song.title} (#{song.rank})"
            end
        else
            puts "\nOther Songs:" unless average_songs.empty?
            average_songs.each do |song|
              puts "#{song.title} (#{song.rank})"
            end
        end

    end

end