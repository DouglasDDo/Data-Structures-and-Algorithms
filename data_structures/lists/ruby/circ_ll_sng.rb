# Objective: Implement a Circular Linked List with singly linked nodes
# Objective: Implement a Circular Linked List with doubly linked nodes
class Node
  attr_accessor :value, :next
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  def to_s
    "#{@value}"
  end
end

class CircularLinkedListSng
  attr_reader :head, :tail, :size
  def initialize(head_value = nil, tail_value = nil)
    @head
    @tail
    @size
  end

  def push

  end

  def pop

  end

  def unshift

  end

  def shift

  end

  def value_at

  end

  def include?

  end

  def display

  end

  def size
    @size
  end

  def empty?
    @size == 0
  end
end
