require "spec_helper"

describe Node do
  subject { Node.new("Node 1") }

  describe '#initialize' do
    its(:name) { should == "Node 1" }
    its(:current) { should == false }
    its(:visited) { should == false }
    its(:tentative_distance) { should == Float::INFINITY }
  end

  describe '#mark_as_visited' do
    before { subject.mark_as_visited }

    its(:visited) { should == true }
  end

  describe '#mark_as_current' do
    before do
      subject.visited = false
      subject.mark_as_current
    end

    its(:visited) { should == true }
    its(:current) { should == true }
  end

  describe '#set_not_current' do
    before { subject.set_not_current }

    its(:current) { should == false }
  end
end