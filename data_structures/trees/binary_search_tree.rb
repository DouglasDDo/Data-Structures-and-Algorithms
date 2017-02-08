module BinarySearchTree
  class Node
    attr_reader :value, :parent

    def initialize(opts = {})
      @value = opts.fetch(:value)
      @parent = opts.fetch(:parent, nil)
      @left = opts.fetch(:left, nil)
      @right = opts.fetch(:right, nil)
    end

    def children
      [@left, @right]
    end

    def add_child(node)
      @left = node
    end

    protected

    def parent=(parent_node)

    end
  end

  # Create a tree of nodes given an array that represents a binary tree
  def array_to_nodes(arr)

  end

  # Create an array representation of a binary tree from a given node
  def node_to_array(node)
    # Maintain queue of nodes?
    # empty results array
    # push current.value; stop if nil
    # push current.left.value; stop if nil
    # push current.right.value; stop if nil
    # How to get back to sibling?
    # Need to be able to form array regardless of whether starting point is root

  end

  module_function :array_to_nodes, :node_to_array
end

foo = BinarySearchTree::Node.new(value: 1)
foo.add_child(1)
