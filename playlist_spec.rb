require_relative "playlist"
require_relative "die"

describe Playlist do

before do
    @playlist = Playlist.new("test playlist")
end

context "single song playlist" do

    before do
        @initial_rank = -10
        @song = Song.new("the happiest days of our lives", @initial_rank)
        @initial_rank = @song.rank #this line had to be added to update the @inital rank
        #variable in the test file so that it is updated to reflect the initialization of the "rank" attribute
        #of the project (which changes negative values to their absolute value versions!)
        @playlist.add_song(@song)
        @round_amount = 2 # you only need to change the test in one place (this line) 
        # to run different number of rounds in the spec file!
    end

    it "initial rank gets converted to a positive value and sorted" do # kind of a "duplicate" test from the one in song_spec.rb
        # expect(@song.rank).to eq(@initial_rank.abs())
        expect(@song.rank).to eq(1)
    end

    it "thumbs up on high number (5-6)" do
        Die.any_instance.stub(:roll).and_return(5)
        @playlist.play(@round_amount)
        expect(@song.rank).to eq((1) - (1 * @round_amount)) # the (1) represents the new ranking of the only song in the list
    end                              # thumbs down makes rank number smaller therefore higher on list!

    it "no change on medium number (3-4)" do
        Die.any_instance.stub(:roll).and_return(3)
        @playlist.play(@round_amount)
        expect(@song.rank).to eq((1))
    end

    it "thumbs down on low number (1-2)" do
        Die.any_instance.stub(:roll).and_return(1)
        @playlist.play(@round_amount)
        expect(@song.rank).to eq((1) + (1 * @round_amount)) # the (1) represents the new ranking of the only song in the list
    end                              # thumbs down makes rank bigger therefore lower on list!
end

context "multiple song playlist" do
    before do 
    @song1 = Song.new("In the Flesh?", 50) # middle song, should come out to rank = 2
    @song2 = Song.new("Vera", 100) # last song, should come out to rank = 3
    @song3 = Song.new("Comfortably Numb", 25) # top song, should come out to rank = 1

    @playlist.add_song(@song1)
    @playlist.add_song(@song2)
    @playlist.add_song(@song3)
    end
    
    it "all three songs are correctly ranked" do
        expect(@song1.rank).to eq(2)
        expect(@song2.rank).to eq(3)
        expect(@song3.rank).to eq(1)
    end
end

end