#crowdfund (8:43PM on 5/8/22)

# project1 = 'ABC'
# funding1 = 1000
# project2 = 'LMN'
# funding2 = 1000
# project3 = 'XYZ'
# funding3 = 1000
# puts "\nProject #{project1} has $#{funding1} in funding."
# puts "\nProjects: \n\t#{project1}\n\t#{project2}\n\t#{project3}"
# title = project1.upcase.ljust(30, '.')
# puts "#{title}#{funding1}"

class Project
    def initialize(name, amount=0, target_goal=1000)
        @name = name
        @amount = amount
        @target_goal = target_goal
        puts "New project '#{@name}' ($#{@amount}) is initialized. Target goal is #{@target_goal}."
    end
    def time_simplified
        current_time = Time.new
        current_time.strftime("%-I:%M %p")
    end
    def fund(value)
        @amount += value
        puts "'#{@name}' received $#{value} in funding!"
        puts "'#{@name}' now has $#{@amount} in funding."
    end
    def defund(value)
        @amount -= value
        puts "'#{@name}' has lost $#{value} in funding!"
        puts "'#{@name}' now has $#{@amount} in funding."
    end
    def describe
        puts "#{@name} has $#{@amount} in funding as of #{@time_simplified}."
    end
    #the default for the amount of funding is 100
    #therefore, $100 gets printed out for the "describe" method.

    def to_s #defines what happens when you use puts on an object of class "Song"
        "#{@name} (#{@amount})"
    end
end

project1 = Project.new('ABC')
project2 = Project.new('LMN', 2000)
project3 = Project.new('XYZ', 100, 30000)

project3.defund(15)
project3.fund(1015)


