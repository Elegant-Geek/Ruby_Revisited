class Die 
    attr_reader :number

    def initialize
        roll #the new die object now initializes as soon as "roll" is called anywhere.
    end

    def roll
        @number = rand(1..6)
    end
end