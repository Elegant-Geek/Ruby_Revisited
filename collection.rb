require_relative 'project'
require_relative 'die'
require_relative 'collection_turn'

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
            CollectionTurn.take_turn(p)
            puts p
        end
    end
end
