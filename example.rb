Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

data = { nodes: [], edges: [] }

node_1 = Node.new("1")
node_2 = Node.new("2")
node_3 = Node.new("3")
node_4 = Node.new("4")
node_5 = Node.new("5")
node_6 = Node.new("6")

data[:nodes] << node_1
data[:nodes] << node_2
data[:nodes] << node_3
data[:nodes] << node_4
data[:nodes] << node_5
data[:nodes] << node_6

data[:edges] << Edge.new([node_1, node_2], 7)
data[:edges] << Edge.new([node_1, node_6], 14)
data[:edges] << Edge.new([node_1, node_3], 9)
data[:edges] << Edge.new([node_2, node_3], 10)
data[:edges] << Edge.new([node_2, node_4], 15)
data[:edges] << Edge.new([node_3, node_4], 11)
data[:edges] << Edge.new([node_3, node_6], 2)
data[:edges] << Edge.new([node_4, node_5], 6)
data[:edges] << Edge.new([node_6, node_5], 9)

graph = Graph.new
graph.set_nodes data[:nodes]
graph.set_edges data[:edges]

solver = DijkstraSolver.new

solver.setup graph

solver.set_start_node "1"
solver.set_end_node "5"

solver.dijkstra

puts "The shortest distance is: #{solver.end_node.tentative_distance}"