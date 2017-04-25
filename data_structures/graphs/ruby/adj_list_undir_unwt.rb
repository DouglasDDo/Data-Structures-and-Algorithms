require 'set'

# Objective: Implement an adjacency list type graph in Ruby

# ALGraph is short for adjacency list graph
class ALGraph

  Edge = Struct.new(:source, :dest)

  def initialize(edges = nil)
    @vertices = {}
    ALGraph.construct_vertices(edges, @vertices) unless edges.nil?
  end

  def edges
    result = []

    @vertices.each_pair do |key, values|
      values.each do |value|
        result << [key, value] unless result.include?([key, value]) || result.include?([value, key])
      end
    end

    result
  end

  def vertices
    @vertices.keys
  end

  def adjacent?(vert1, vert2)
    return false if @vertices[vert1].nil? || @vertices[vert2].nil?
    @vertices[vert1].include?(vert2)
  end

  def neighbors(vertex_id)
    @vertices[vertex_id].to_a
  end

  def add_edge(new_edge)
    unless (@vertices[new_edge.source] && @vertices[new_edge.source].include?(new_edge.dest)) ||
           (@vertices[new_edge.dest] && @vertices[new_edge.dest].include?(new_edge.source))

      @vertices[new_edge.source] = Set.new([]) if @vertices[new_edge.source].nil?
      @vertices[new_edge.dest]  = Set.new([]) if @vertices[new_edge.dest].nil?

      @vertices[new_edge.source] << new_edge.dest
      @vertices[new_edge.dest] << new_edge.source
    end

    @vertices
  end

  def delete_edge(rm_edge)
    @vertices[rm_edge.source].delete?(rm_edge.dest)
    @vertices[rm_edge.dest].delete?(rm_edge.source)

    @vertices
  end

  def add_vertex(new_vertex)
    @vertices[new_vertex] = Set.new []

    @vertices
  end

  def delete_vertex(rm_vertex)
    @vertices.delete(rm_vertex) {|vert| "That vertex does not exist."}

    @vertices.each_value do |neighbors|
      neighbors.delete?(rm_vertex)
    end

    @vertices
  end


  private

  def self.construct_vertices(edges, vertices)
    edges.each do |edge|
      vertices[edge.source] = Set.new []
      vertices[edge.dest] = Set.new []
    end

    edges.each do |edge|
      vertices[edge.source] << edge.dest
      vertices[edge.dest] << edge.source
    end
  end
end

foo = [['a','b'], ['b', 'c'], ['b', 'd'], ['a', 'd']]
bar = []
foo.each do |f|
  bar << ALGraph::Edge.new(f[0], f[1])
end

zaz = ALGraph.new(bar)
zoo = ALGraph::Edge.new('a', 'f')
p zaz.add_edge(zoo)
p zaz.edges
p zaz.delete_edge(zoo)
