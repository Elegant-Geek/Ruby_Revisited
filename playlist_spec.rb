require_relative "playlist"
require_relative "die"

describe Playlist do

before do
    @playlist = Playlist.new("test playlist")
end

context "single playlist song" do

    before do
        @initial_rank = 10
        @song = Song.new("the happiest days of our lives", @initial_rank)
        @playlist.add_song(@song)
    end

    it "thumbs up on high number (5-6)" do
        Die.any_instance.stub(:roll).and_return(5)
        @playlist.play
        expect(@song.rank).to eq(@initial_rank + 1)
    end

    it "no change on medium number (3-4)" do
        Die.any_instance.stub(:roll).and_return(3)
        @playlist.play
        expect(@song.rank).to eq(@initial_rank)
    end

    it "thumbs down on low number (1-2)" do
        Die.any_instance.stub(:roll).and_return(1)
        @playlist.play
        expect(@song.rank).to eq(@initial_rank - 1)
    end
end

end