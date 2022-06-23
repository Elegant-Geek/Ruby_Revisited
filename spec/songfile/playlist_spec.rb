# require_relative "playlist"
require 'songfile/playlist'
# require_relative "die"
require 'songfile/die'
# require_relative "council"
require 'songfile/council'
module Songfile
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

            it "initial rank gets converted to a positive value" do # kind of a "duplicate" test from the one in song_spec.rb
                # expect(@song.rank).to eq(@initial_rank.abs())
                expect(@song.rank).to eq(10)
            end

            it "initial rank gets normalized correctly" do # not a duplicate test, this tests the normalize and multiplier methods
                # expect(@song.rank).to eq(@initial_rank.abs())
                @playlist.sort_songs
                @playlist.normalize_ranks
                expect(@song.rank).to eq(1)
            end
            
            it "initial rank gets normalized and multiplied correctly" do # not a duplicate test, this tests the normalize and multiplier methods
                # expect(@song.rank).to eq(@initial_rank.abs())
                @playlist.sort_songs
                @playlist.normalize_ranks
                @playlist.multiply_ranks
                expect(@song.rank).to eq(10)
            end

            it "thumbs up on high number (5-6)" do
                Die.any_instance.stub(:roll).and_return(5)
                allow(Council).to receive(:random).and_return(Council::REVIEWERS[0]) # FINALLY got the right code to retrieve roger each roll!
                @playlist.play(@round_amount)
                expect(@song.rank).to eq((10) - (100 * @round_amount)) # the (100) represents the new ranking (normalized and multiplied) of the only song in the list
            end                              # thumbs down makes rank number smaller therefore higher on list!

            it "no change on medium number (3-4)" do
                Die.any_instance.stub(:roll).and_return(3)
                @playlist.play(@round_amount)
                expect(@song.rank).to eq((10))  # 10: The one song in the playlist gets a normalized rank of 1 which gets multiplied to 10.
            end

            it "thumbs down on low number (1-2)" do
                Die.any_instance.stub(:roll).and_return(1)
                allow(Council).to receive(:random).and_return(Council::REVIEWERS[0])
                @playlist.play(@round_amount)
                expect(@song.rank).to eq((10) + (100 * @round_amount)) # the (10) represents the new ranking (normalized and multiplied) of the only song in the list
            end                              # thumbs down makes rank bigger therefore lower on list!
        end

        context "multiple song playlist" do
            before do 
            @song1 = Song.new("In the Flesh?", 500) # middle song, should come out to rank = 2
            @song2 = Song.new("Vera", 1000) # last song, should come out to rank = 3
            @song3 = Song.new("Comfortably Numb", 25) # top song, should come out to rank = 1

            @playlist.add_song(@song1)
            @playlist.add_song(@song2)
            @playlist.add_song(@song3)

            @playlist.sort_songs #this method sorts before running the game!
            @playlist.normalize_ranks #this normalizes the ranks to the array size
            end

            it "all three songs are correctly sorted in the playlist" do
                expect(@playlist.show_titles).to eq(["Comfortably Numb", "In the Flesh?", "Vera"])
            end

            it "all three songs are correctly ranked" do
                expect(@song1.rank).to eq(2)
                expect(@song2.rank).to eq(3)
                expect(@song3.rank).to eq(1)
            end

        end

        context "default values replacing nils (multiple song playlist)" do
            before do
            @my_list = Playlist.new("Jamie's Pink Floyd Playlist")

            default_player_file = File.join(File.dirname(__FILE__), "../../bin/THE_WALL.csv") #plays an entered file OR the default (WALL.csv)
            @my_list.load_songs(ARGV.shift || default_player_file)
            end

            it "replaces nil rank values with default value of 10000" do
                expect(@my_list.list[11].rank).to eq(10000) # "young lust" correctly gets assigned default rank of 10000
            end
        end

    end
end