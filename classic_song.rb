require_relative 'song'
class ClassicSong < Song
    attr_reader :initial_rank
    def initialize(title, rank=10000)
        @initial_rank = rank
        @title = titleize(title)
        @rank = (rank.abs()) / 2
        puts "New song '#{@title}' (classic) with rank of #{@rank} was created."
        # puts "The classic song '#{@title}' jumps the chart with a halved rank !"
      end
end

if __FILE__ == $0
    classic_song = ClassicSong.new("Time", 10000) 
    # puts "The classic song '#{classic_song.title}' jumps the chart with a halved rank (#{classic_song.initial_rank}/2) of #{classic_song.rank}!"
end

