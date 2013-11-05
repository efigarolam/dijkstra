require "awesome_print"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

def validates_edge(nodes, first_node, second_node, value)
  ((nodes.select { |node| node.name == first_node }.pop && nodes.select { |node| node.name == second_node }.pop && Integer(value)) rescue false)
end

puts "Welcome, please introduce valid data for a Graph...\n"

puts "Please introduce the nodes name separated by commas: "

nodes_names = gets.chomp

nodes = []
nodes_names.split(",").each do |future_node|
  nodes << Node.new(future_node)
end

puts "The following nodes have been created: \n"

ap nodes

puts "\n It's time to create the edges... How many edges will have the graph?: "

edges_number = (Integer(gets.chomp) rescue false)

edges = []

if edges_number
  edges_number.times do
    puts "\n ==== New Edge ==== \n"
    puts "\nPlease choose the first node:"
    first_node_name = gets.chomp

    puts "\nPlease choose the second node:"
    second_node_name = gets.chomp

    puts "\nPlease introduce the edge's value:"
    value = gets.chomp

    if validates_edge(nodes, first_node_name, second_node_name, value)
      edges << Edge.new([nodes.select { |node| node.name == first_node_name }.pop, nodes.select { |node| node.name == second_node_name }.pop], Integer(value))
    else
      puts "\n There is an error with the data, please be careful..."
      break
    end
  end
end

puts "\nThe following edges have been created: \n"

ap edges

while true do
  puts "\nPlease put the name of the start node:"

  start_node = gets.chomp

  puts "\nPlease put the name of the end node:"

  end_node = gets.chomp

  graph = Graph.new
  graph.set_nodes nodes
  graph.set_edges edges

  solver = DijkstraSolver.new

  solver.setup graph

  solver.set_start_node start_node
  solver.set_end_node end_node

  solver.dijkstra

  puts "\n ==== The shortest distance is: #{solver.end_node.tentative_distance} ===="

  puts "\n Do you want to choose a different nodes? (y/n)"

  answer = gets.chomp

  break if answer.downcase == "n"
  solver.reset_nodes_status
end


