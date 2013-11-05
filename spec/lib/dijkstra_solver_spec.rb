require "spec_helper"

describe DijkstraSolver do
  let(:node_1) { Node.new("1") }
  let(:node_2) { Node.new("2") }
  let(:node_3) { Node.new("3") }
  let(:node_4) { Node.new("4") }
  let(:node_5) { Node.new("5") }
  let(:node_6) { Node.new("6") }

  let(:nodes) do
    [
      node_1,
      node_2,
      node_3,
      node_4,
      node_5,
      node_6
    ]
  end

  let(:edges) do
    [
      Edge.new([node_1, node_2], 7),
      Edge.new([node_1, node_6], 14),
      Edge.new([node_1, node_3], 9),
      Edge.new([node_2, node_3], 10),
      Edge.new([node_2, node_4], 15),
      Edge.new([node_3, node_4], 11),
      Edge.new([node_3, node_6], 2),
      Edge.new([node_4, node_5], 6),
      Edge.new([node_6, node_5], 9)
    ]
  end

  let(:graph) { Graph.new }

  subject { DijkstraSolver.new }

  before do
    graph.set_nodes nodes
    graph.set_edges edges
    subject.setup graph
  end

  describe '#setup' do
    its(:graph) { should == graph }
  end

  describe '#set_start_node' do
    before { subject.set_start_node node_1.name }

    it "sets the start_node property" do
      subject.start_node.name.should == node_1.name
    end
  end

  describe '#set_end_node' do
    before { subject.set_end_node node_5.name }

    it "sets the start_node property" do
      subject.end_node.name.should == node_5.name
    end
  end

  describe '#dijkstra' do
    before do
      subject.set_start_node node_1.name
      subject.set_end_node node_5.name
    end

    it "returns the shortest distance" do
      subject.dijkstra.should == 20
    end
  end
end