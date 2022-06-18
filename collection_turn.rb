require_relative 'project'
require_relative 'die'

module CollectionTurn

    def self.take_turn(p)
        die = Die.new
            number_rolled = die.roll
            case number_rolled 
            when 5..6
                p.fund(15)    
            when 3..4     
                puts "#{p.name} was skipped."    
            when 1..2
                p.defund(10)               
            else # (nothing is added if die roll is 3 or 4... or 0 etc.)
            end
    end
end