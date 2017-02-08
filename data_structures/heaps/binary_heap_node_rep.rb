# Objective: Implement a binary heap using a dedicated node class

class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(args = {})
    @value = args.fetch(:value, nil)
    @left = args.fetch(:left, nil)
    @right = args.fetch(:right, nil)
    @parent = args.fetch(:parent, nil)
  end

  def to_s
    "#{@value}"
  end
end

class Heap
  attr_accessor

  def initialize()

  end

  def peek

  end

  def empty?

  end

  def size

  end

  def insert

  end

  def extract

  end

  def delete

  end

  def replace

  end

  def merge

  end

  def meld

  end

  # heapify
  # create empty
end
