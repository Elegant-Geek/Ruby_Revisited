#SONGFILE
#RUN THIS ONE
#(File created 9:47PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 5/24/22
Lowercase_words = %w{and as at but by for from 
    if in into like near nor of off on once 
    onto or over past so than that the till 
    to up upon v. vs vs. with when yet}

class Song
    attr_reader :rank                   # allows you to print the "rank" attribute outside the Song class (GETTER method)
    # attr_writer :title, :rank         # allows you to write to the "title" and "rank" attributes outside the Song class (SETTER method)
    attr_accessor :title                # allows you to read and write to "title" attribute outside the Song class

    def titleize(title) #the actual titleize method (only hangup is "Like" (as a verb) vs "like" (as a preposition))
        title.downcase.split.each_with_index.map{ |x, index| Lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
    end
   
    def initialize(title, rank=0)       #this method converts a Song.new specified title to the correct format when created
        @title = title
        @title = titleize(@title)
        @rank = rank
        puts "New song '#{@title}' with rank of #{@rank} is initialized."
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

pigsonthewing = Song.new("Another brick IN the Wall", 100)
pigsonthewing.describe
pigsonthewing.thumbs_down
pigsonthewing.describe
pigsonthewing.thumbs_up
pigsonthewing.thumbs_up
pigsonthewing.describe
puts pigsonthewing.inspect # a built-in method to see what an object contains.
puts pigsonthewing

puts pigsonthewing.title
puts pigsonthewing.rank

pigsonthewing.title = "the ballad of buster scruggs"
puts pigsonthewing.title




