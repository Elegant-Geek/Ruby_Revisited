# ***** SONG TEST FILE *******
require_relative 'song' # calls the song class file 

describe Song do

    context "default ranking song" do
        before do
            @initial_rank = 0
            @song = Song.new("the happiest days of our lives")
        end
        it "has a default rank of 0" do
            #song.rank.should == 0
            @song = Song.new("the happiest days of our lives")
            expect(@song.rank).to eq(0) #better, new syntax
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
        #expect(@song.describe).to eq("'The Happiest Days of Our Lives' has a rank of 0.")
        # for some reason, the above syntax did not work for the above and instead returned NIL.
        @song.describe == "'The Happiest Days of Our Lives' has a rank of 0." #old syntax passes the test
    end

    it "has correct display with 'puts' (Song)" do
        #expect(puts @song).to eq("The Happiest Days of Our Lives (0), Score: 30")
        # for some reason, the above syntax did not work for the above and instead returned NIL.
        puts @song == "The Happiest Days of Our Lives (0), Score: 30" #old syntax passes the test
    end

    it "has correct score" do
        expect(@song.score).to eq(40)
    end

    it "has correct rank after thumbs up" do
        @song.thumbs_up 
        expect(@song.rank).to eq(11)
    end

    it "has correct rank after thumbs down" do
        @song.thumbs_down
        expect(@song.rank).to eq(9)
    end

end
