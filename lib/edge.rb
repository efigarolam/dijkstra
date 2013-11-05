class Edge
  attr_accessor :value, :nodes

  def initialize(nodes, value)
    @nodes = nodes
    @value = value
  end

  def select_complement_node(selected_node)
    nodes.select { |node| (node != selected_node && !node.visited?)  }.pop
  end
end