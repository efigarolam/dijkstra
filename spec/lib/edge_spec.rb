require "spec_helper"

describe Edge do
  let(:nodes) { [Node.new("Node 1"), Node.new("Node 2")] }
  subject { Edge.new(nodes, 10) }

  describe '#initialize' do
    its(:nodes) { should == nodes }
    its(:value) { should == 10 }
  end

  describe '#select_complement_node' do
    it 'returns the complement node of the edge' do
      subject.select_complement_node(nodes.first).should == nodes.last
    end
  end
end