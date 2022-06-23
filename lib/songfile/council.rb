module Songfile #< this line nested on TOP of Reviewer = Struct.new
Reviewer = Struct.new(:name, :influence) #bigger number means more influence (I use them as multiplier values)
    module Council
        REVIEWERS = [
            Reviewer.new(:Roger_Waters, 100),
            Reviewer.new(:Nick_Mason, 50),
            Reviewer.new(:David_Gilmour, 100),
            Reviewer.new(:Richard_Wright, 50),
            Reviewer.new(:Syd_Barrett, 25)
        ]

        def self.random
            REVIEWERS.sample
        end
    end

    if __FILE__ == $0
        p Council::REVIEWERS.map(&:name)
        person = Council.random
        puts "#{person.name} is reviewing your playlist."
    end
end