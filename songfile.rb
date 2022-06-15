#SONGFILE
#RUN THIS ONE
#(File created 9:47PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - ....  11:15pm 6/8/22 (oof)
#day four is 7:33pm - ....  ??pm 6/14/22 

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

song1 = Song.new("In the Flesh?", 100)
song2 = Song.new("Vera", 200)
song3 = Song.new("Comfortably Numb", 300)

my_list = Playlist.new("Jamie's Pink Floyd Playlist")
my_list.add_song(song1)
my_list.add_song(song2)
my_list.add_song(song3)
my_list.play




