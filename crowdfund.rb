#crowdfund (File created 8:43PM on 5/8/22)
#end of day one is 8:24pm-10:47pm 5/8/22
#day two is 5:45pm - .... 9pm 5/24/22
#day three is 9:55pm - .... 11:15pm 6/8/22 (oof)
#day four is 7:30pm - 8:30pm, resumed at 9:40pm - 1AM  6/14/22 


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

# I DID NOT DO DIE ROLL AND TDD (MODULES 12 + 13) WITH THIS YET

class Project
    attr_accessor :name
    def initialize(name, amount=0, target_goal=10000)
        @name = name
        @amount = amount
        @target_goal = target_goal
        puts "New project '#{@name}' ($#{@amount}) is initialized. Target goal is #{@target_goal}."
    end
    def fund(value=0)
        @amount += value
        puts "'#{@name}' received $#{value} in funding!"
        puts "'#{@name}' now has $#{@amount} in funding."
    end
    def defund(value=0)
        @amount -= value
        puts "'#{@name}' has lost $#{value} in funding!"
        puts "'#{@name}' now has $#{@amount} in funding."
    end
    def describe
        @current_time = Time.new.strftime("%-m/%-d/%-y at %-I:%M %p")
            if @amount > @target_goal
            puts "Project #{@name}: $#{@amount}/#{@target_goal} (over goal) as of #{@current_time}."
            elsif @amount < @target_goal
                puts "Project #{@name}: $#{@amount}/#{@target_goal} (under goal) as of #{@current_time}."
            else
                puts "Project #{@name}: $#{@amount}/#{@target_goal} (at goal) as of #{@current_time}."
        end
    end

    #the default for the amount of funding is 100
    #therefore, $100 gets printed out for the "describe" method.

    def to_s #defines what happens when you use puts on an object of class "Song"
        "#{@name} (#{@amount})"
    end
end

class Collection
    attr_reader :name 
    def initialize(name)       #this method converts a Collection.new specified title to the correct format when created
        @name = name.upcase    #upcased all collection titles for now
        @collection = []
        puts "Collection '#{@name}' was created."
    end

    def add_project(project)
        @collection << project 
    end

    def run_projects
        puts "There are currently #{@collection.size} projects:"
        @collection.each do |project|
            puts "#{@collection.index(project) + 1}) #{project.name}"
        end

        @collection.each do |p|
            p.describe
            p.fund(50000)
            p.defund(25000)
            p.fund(500)
            p.describe
        end
    end
end

project1 = Project.new('ABC', 0, 25500)
project2 = Project.new('LMN', 2000)
project3 = Project.new('XYZ', 100, 30000)

my_collection = Collection.new("Jamie's collection of projects")
my_collection.add_project(project1)
my_collection.add_project(project2)
my_collection.add_project(project3)

my_collection.run_projects


