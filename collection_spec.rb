require_relative "collection"
require_relative "die"

describe Collection do

before do
    @collection = Collection.new("test collection")
end

context "single project collection" do
    before do
        @collection = Collection.new("Jamie's collection of projects")
    end

    before do
        @initial_amount = -500
        @project = Project.new('ABC', @initial_amount, -3000)
        @initial_amount = @project.amount #this line had to be added to update the @inital amount
        #variable in the test file so that it is updated to reflect the initialization of the "amount" attribute
        #of the project (which changes negative values to their absolute value versions!)
        @collection.add_project(@project)
    end

    it "FUNDS on a high number (5-6)" do
        Die.any_instance.stub(:roll).and_return(5)
        @collection.run_projects
        expect(@project.amount).to eq(@initial_amount + 15)
    end

    it "no change on medium number (3-4)" do
        Die.any_instance.stub(:roll).and_return(3)
        @collection.run_projects
        expect(@project.amount).to eq(@initial_amount)
    end

    it "DEFUNDS on a low number (1-2)" do
        Die.any_instance.stub(:roll).and_return(1)
        @collection.run_projects
        expect(@project.amount).to eq(@initial_amount - 10)
    end
end

end