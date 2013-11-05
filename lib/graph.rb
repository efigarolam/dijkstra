class Graph
  attr_accessor :nodes, :edges

  def set_nodes(nodes)
    @nodes = nodes
  end

  def set_edges(edges)
    @edges = edges
  end

  def select_node(name)
    @nodes.select { |node| node.name == name }.pop
  end
end