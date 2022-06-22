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
    def show_pledges
        pledges = PledgePool::PLEDGES
        puts "\nThere are #{pledges.size} pledge tiers:"
        pledges.each do |p|
        puts "#{p.name} tier is a donation of $#{p.amount}."
        end
    end

    def print_stats
        puts "\n#{@name}"
        @sorted_list = @collection.sort { |a, b| b.amount <=> a.amount }
        @sorted_list.each do |p|
            p.describe
            puts "Total pledge tier donations for #{p.name}:"
            p.each_pledge_received do |pledge|
            puts "#{pledge.name}: $#{pledge.amount}"
          end
        puts "Other donations: $#{p.amount}"
        end

        met_goal, under_goal = @sorted_list.partition { |project| project.total_amount >= project.target_goal }
             unless met_goal.empty?
                puts "\nProjects at/over goal:" 
                met_goal.each do |project|
                puts "#{project.name}: $#{project.total_amount}/#{project.target_goal}" #NOTE:  ALWAYS CALL TOTAL_AMOUNT (sum of all pledges + @amount)
                end
            end
            unless under_goal.empty?
                puts "\nProjects under goal:" 
                under_goal.each do |project|
                puts "#{project.name}: $#{project.total_amount}/#{project.target_goal}" #NOTE:  ALWAYS CALL TOTAL_AMOUNT (sum of all pledges + @amount)
                end
            end

    end

    def run_projects(rounds=1) #play one round by default
        puts "\nThere are currently #{@collection.size} projects:" #no sorting called here at first
        @collection.each do |project|
            puts "#{@collection.index(project) + 1}) #{project.name}"
        end

        show_pledges

        1.upto(rounds) do |round|
            puts "\nRound #{round}:"

            @collection.each do |p|
                puts p
                CollectionTurn.take_turn(p)
                puts p
            end

        # after all rounds, this describes each project's funding (similar to print stats method for the playlist project):
        end
    end
end
