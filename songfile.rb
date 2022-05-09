#SONGFILE
#RUN THIS ONE
class Song
    def initialize(title, rank=0)
        @title = title
        @rank = rank
        puts "New song '#{@title}' with rank of #{@rank} is initialized."
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
    def to_s #defines what happens when you use puts on an object of class "Song"
        "#{@title} (#{@rank})"
    end
end

pigsonthewing = Song.new("Pigs on the Wing", 100)
pigsonthewing.describe
pigsonthewing.thumbs_down
pigsonthewing.describe
pigsonthewing.thumbs_up
pigsonthewing.thumbs_up
pigsonthewing.describe
puts pigsonthewing.inspect # a built-in method to see what an object contains.
puts pigsonthewing
