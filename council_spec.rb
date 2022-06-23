require_relative "council"
module Songfile
  describe Reviewer do

    before do
      @reviewer = Reviewer.new(:Tre_Cool, 49)
    end

    it "has a name attribute" do
      @reviewer.name.should == :Tre_Cool
    end

    it "has a correct influence (age in this case) attribute" do
      @reviewer.influence.should == 49
    end

  end

  describe Council do

    it "returns a random reviewer from the council" do
      reviewer = Council.random
      Council::REVIEWERS.should include(reviewer)
    end

    it "has five reviewers" do
      Council::REVIEWERS.size.should == 5
    end

    it "has Roger Waters (100)" do
      Council::REVIEWERS[0].should == Reviewer.new(:Roger_Waters, 100)
    end

    it "has Nick Mason (50)" do
      Council::REVIEWERS[1].should == Reviewer.new(:Nick_Mason, 50)
    end

    it "has David_Gilmour (100)" do
      Council::REVIEWERS[2].should == Reviewer.new(:David_Gilmour, 100)
    end

    it "has Richard_Wright (50)" do
      Council::REVIEWERS[3].should == Reviewer.new(:Richard_Wright, 50)
    end

    it "Syd_Barrett (25)" do
      Council::REVIEWERS[4].should == Reviewer.new(:Syd_Barrett, 25)
    end

  end
end 