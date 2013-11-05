class Node
  attr_accessor :name, :visited, :current, :tentative_distance

  def initialize(name)
    @name = name
    @current = false
    @visited = false
    @tentative_distance = Float::INFINITY
  end

  def mark_as_visited
    @visited = true
  end

  def visited?
    @visited
  end

  def current?
    @current
  end

  def mark_as_current
    mark_as_visited
    @current = true
  end

  def set_not_current
    @current = false
  end
end