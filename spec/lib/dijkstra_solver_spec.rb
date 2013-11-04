require "spec_helper"

describe DijkstraSolver do
  subject { DijkstraSolver.new }

  it "accepts a graph" do
    subject.class.should == DijkstraSolver
  end
end