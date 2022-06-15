require_relative 'playlist'
# set Lowercase_words to be a global variable bc the warning was annoying! 
# the warning in question: "warning: already initialized constant Lowercase_words"

$Lowercase_words = %w{and as at but by for from 
    if in into like near nor of off on once 
    onto or over past so than that the till 
    to up upon v. vs vs. with when yet}

class Song
    attr_reader :rank                   # allows you to print the "rank" attribute outside the Song class (GETTER method)
    # attr_writer :title, :rank         # allows you to write to the "title" and "rank" attributes outside the Song class (SETTER method)
    attr_accessor :title                # allows you to read and write to "title" attribute outside the Song class

    def titleize(title) #the actual titleize method (only hangup is "Like" (as a verb) vs "like" (as a preposition))
        title.downcase.split.each_with_index.map{ |x, index| $Lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
    end
   
    def initialize(title, rank=0)       #this method converts a Song.new specified title to the correct format when created
        @title = title
        @title = titleize(@title)
        @rank = rank
        puts "New song '#{@title}' with rank of #{@rank} was created."
    end

    def title=(new_title)               #this method converts a Song.new specified title to the correct format when overwritten
        @title = new_title
        @title = titleize(@title)
    end

    def thumbs_up
        @rank += 1
        puts "'#{@title}' received a thumbs up!"
    end

    def thumbs_down
        @rank -= 1
        puts "'#{@title}' received a thumbs down!"
    end

    def describe 
        puts "'#{@title}' has a rank of #{@rank}."
    end

    def score
        @rank + @title.length
    end

    def to_s #defines what happens when you use puts on an object of class "Song"
        "#{@title} (#{@rank}), Score: #{score}"
    end
end

#code that only runs inside THIS file (songfile.rb relies only on the class code and ignores this if statement code)
if __FILE__ == $0
    song1 = Song.new("Run like Hell", 100)
    song2 = Song.new("The Trial", 200)
    song3 = Song.new("Outside the Wall", 300)
    array = [song1, song2, song3]
    array.each do |song|
        puts song
        song.describe
        song.thumbs_up
        song.thumbs_up
        song.thumbs_down
        song.thumbs_up
        puts song
end

end
