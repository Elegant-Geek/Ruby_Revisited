require_relative 'project'
require_relative 'die'

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
            puts p
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
            puts p
        end
    end
end
