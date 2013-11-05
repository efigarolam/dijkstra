require "spec_helper"

describe Graph do
  subject { Graph.new }

  describe '#set_nodes' do
    it 'sets the property nodes' do
      subject.set_nodes [Node.new("Node 1"), Node.new("Node 2")]

      subject.nodes.count.should == 2
    end
  end

  describe '#set_edges' do
    it 'sets the property edges' do
      subject.set_edges [Edge.new([Node.new("Node 1"), Node.new("Node 2")], 10)]

      subject.edges.count.should == 1
    end
  end

  describe '#select_node' do
    it 'returns a specific node' do
      subject.set_nodes [Node.new("Node 1"), Node.new("Node 2")]
      node = subject.select_node("Node 1")

      node.name.should == "Node 1"
    end
  end
end