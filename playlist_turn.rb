require_relative 'song'
require_relative 'die'
require_relative 'council'
module Songfile
    module PlaylistTurn

        def self.take_turn(song)

            reviewer = Council.random
            #puts reviewer
            puts "'#{song.title}' was reviewed by #{reviewer.name} (#{reviewer.influence} influence)"

            die = Die.new
                number_rolled = die.roll
                case number_rolled 
                when 5..6
                    song.thumbs_up(reviewer.influence)     
                when 3..4     
                    puts "'#{song.title}' was skipped."    
                when 1..2
                    song.thumbs_down(reviewer.influence)                
                else # (nothing is added if die roll is 3 or 4... or 0 etc.)
                end
        end
    end
end