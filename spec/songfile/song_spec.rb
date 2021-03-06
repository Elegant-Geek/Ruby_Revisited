# ***** SONG TEST FILE *******
# require_relative 'song' # calls the song class file 
require 'songfile/song'

module Songfile
    describe Song do

        context "song with a NEGATIVE ranking" do
            before do
                @song = Song.new("the happiest days of our lives", -10) # a user types in a negative rank (not ok)
            end

            it "automatically gets a negative rank # assigned to a positive rank #" do
                expect(@song.rank).to eq(10) #rather than -10
            end
        end

        context "default ranking song" do
            before do
                @initial_rank = 0
                @song = Song.new("the happiest days of our lives")
            end

            it "has a default rank of 10000" do
                #song.rank.should == 10000
                @song = Song.new("the happiest days of our lives")
                expect(@song.rank).to eq(10000) #Changed default to 10000 so UNRANKED songs are listed lowest in the playlist (assuming other RANKED songs are < 10000)
            end

            it "IS NOT a top 10 song" do
                expect(@song.status).to eq("*Not Top 10*")
            end
        end

        before do
            @initial_rank = 10
            @song = Song.new("the happiest days of our lives", @initial_rank)
        end

        it "has a capitalized title" do
            #song.title.should == "The Happiest Days of Our Lives"
            expect(@song.title).to eq("The Happiest Days of Our Lives") #better, new syntax
        end

        it "has an initial rank" do
            #song.title.should == "The Happiest Days of Our Lives"
            expect(@song.rank).to eq(10) #better, new syntax
            expect(@initial_rank).to eq(10) #better, new syntax
        end

        it "has correct description" do
            expect do
                @song.describe
            end.to output("'#{@song.title}' has a rank of #{@song.rank}.\n").to_stdout
        end

        it "has correct display with 'to_s' (Song)" do
            expect(@song.to_s).to eq("The Happiest Days of Our Lives (10)") #removed *top 10* display from to_s method
        end

        it "has correct status" do
            expect(@song.status).to eq("*Top 10*")
        end

        it "has correct rank after thumbs up" do
            @song.thumbs_up 
            expect(@song.rank).to eq(9)
        end

        it "has correct rank after thumbs down" do
            @song.thumbs_down
            expect(@song.rank).to eq(11)
        end

        it "IS a top 10 song" do
            expect(@song.status).to eq("*Top 10*")
        end

    end
end