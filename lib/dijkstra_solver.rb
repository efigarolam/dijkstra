class DijkstraSolver
  attr_accessor :graph, :start_node, :end_node, :unvisited_neighbors, :current_node

  def setup(graph)
    @graph = graph
  end

  def set_start_node(node_name)
    @start_node = graph.select_node node_name
    prepare_start_node
  end

  def set_end_node(node_name)
    @end_node = graph.select_node node_name
  end

  def dijkstra
    unvisited_neighbors[:nodes].each_with_index do |node, index|
      distance = current_node.tentative_distance

      distance += distances[index]
      node.tentative_distance = distance if distance < node.tentative_distance
    end

    change_current_node
    if end_node.visited?
      end_node.tentative_distance
    else
      dijkstra
    end
  end

  private

  def prepare_start_node
    @start_node.tentative_distance = 0
    @start_node.mark_as_current
  end

  def unvisited_neighbors
    neighbors = {nodes: [], distances: []}

    graph.edges.each do |edge|
      node = edge.select_complement_node(current_node) if edge.nodes.include? current_node
      neighbors[:nodes] << node if node
      neighbors[:distances] << edge.value if (node && edge.nodes.include?(current_node))
    end

    neighbors
  end

  def distances
    unvisited_neighbors[:distances]
  end

  def current_node
    graph.nodes.select { |node| node.current? }.pop
  end

  def change_current_node
    new_current_node = unvisited_neighbors[:nodes].sort_by { |node| node.tentative_distance }.first
    current_node.set_not_current

    new_current_node.mark_as_current
  end


end