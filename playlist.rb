require_relative 'song'
require_relative 'die'
require_relative 'playlist_turn'
require_relative 'council'
require 'csv'

class Playlist
    attr_reader :name, :list          #you can read the title (name) of the playlist
    def initialize(name)       #this method converts a Playlist.new specified title to the correct format when created
        @name = name.upcase    #upcased all playlist titles for now
        @list = []
        puts "Playlist '#{@name}' was created."
    end

    def show_titles
        p self.list.map(&:title) # p is used within the method to print the array properly, and it is only an array of titles
    end

    def show_reviewers
        reviewers = Council::REVIEWERS
        puts "\nThere are #{reviewers.size} playlist reviewers:"
        reviewers.each do |r|
        puts "#{r.name}, #{r.influence}"
    end
    end

    def add_song(song) #when you add a song, the list re-sorts itself
        @list << song 
        #@list = @list.sort { |a, b| a.rank <=> b.rank }
        # NOTE: ^^ I disabled the list sorting itself whenever a new song is added. All the responsibility is
        # now handed over to the sort songs method which 1) sorts all songs in array by rank then 
        # normalizes the rank values based on the amount of songs in the playlist!
    end

    def sort_songs #created this method... it looks very similar to the print_stats method
        @list.each do |song| #sort by rank step 1
            @list = @list.sort { |a, b| a.rank <=> b.rank }
            end
    end
    def normalize_ranks
        @list.each do |song| #step 2 (after ALL songs are sorted by rank)
            song.rank = @list.index(song) + 1 # NOW you normalize rank once all songs are sorted
            #song.rank = @list.index(song) + 1 # NOW you normalize rank once all songs are sorted
            # puts "#{song.rank}) #{song.title}"
        end 
    end
    def multiply_ranks
        @list.each do |song| #step 2 (after ALL songs are sorted by rank)
            song.rank *= 10 # multiplies each song's rank by 10. This method is used after "normalize ranks" in the play method 
        end 
    end

    def play(rounds=1) #play one round by default
        puts "\nThere are #{@list.size} songs in this playlist:"
        sort_songs # use of SELF to call sort_songs on the applicable Playlist object from inside the play method
        normalize_ranks # is now separate from sorting songs

        @list.each do |song|
            puts "#{song.rank}) #{song.title}"
        end 

        multiply_ranks

        show_reviewers # this method is standalone, no reference to self is needed

        1.upto(rounds) do |round|
            puts "\nRound #{round}:"
        # puts "number rolled is #{number_rolled}"
            @list.each do |song|
                puts song
                PlaylistTurn.take_turn(song)
                puts song
            end
        end

        #self.print_stats #activating this code will make two tests fail because sort/normalization is 
                          #performed within the print stats method which, when enabled INSIDE the "play" method
                          #makes the math check test fail! (activating this code sorts/normalizes the new ranks
                          #before the math checker is run, aka after the "play" method is completed)
    end

    def print_stats
        sort_songs # FIRST SORT FOR PREVIEW/DISPLAY
        puts "\n#{@name} Final Rankings:"
        @list.each do |song|
            puts "#{song.title} (#{song.rank})"
        end

        normalize_ranks # NOW NORMALIZE RANKINGS

        top_ten_songs, average_songs = @list.partition { |song| song.top_ten? }

    if @list.size > 10
        puts "\nTop 10 Songs:" 
        top_ten_songs.each do |song|
        puts "#{song.rank}) #{song.title}"
        end
    puts "\nOther Songs:" 
        average_songs.each do |song|
        puts "#{song.rank}) #{song.title}"
        end
    else
        puts "\nTop #{@list.size} Songs:" 
        @list.each do |song|
        puts "#{song.rank}) #{song.title}"
        end
    end
    end

    def load_songs(from_file)
        CSV.foreach(from_file) do |row|
            if row[1].to_i == 0
                song = Song.new(row[0], 10000) # THIS is the code that sets nil to 10000 by default so that sorted song is ranked last in playlist
            else
                song = Song.new(row[0], row[1].to_i)# << this "index" stuff syntax allows for nil ranks to "pass/fly" (and get reassigned to default of 0) THIS is where default gets assigned.
            end
          add_song(song) 
        end
    end
      
end