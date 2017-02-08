# Objective: Implement a Circular Linked List with doubly linked nodes

class Node
  attr_accessor :value, :next, :prev
  def initialize(value = nil, next_node = nil, prev_node = nil)
    @value = value
    @next = next_node
    @prev = prev_node
  end

  def to_s
    "#{@value}"
  end
end

class CircularLinkedListSng
  attr_reader :head, :tail, :size
  def initialize(head_value = nil, tail_value = nil)
    @head = Node.new(head_value)
    @tail = Node.new(tail_value)
    @size = (head_value.nil? ^ tail_value.nil?) ? 1 : 0

    if head_value && tail_value
      @head.next = @tail
      @tail.prev = @head
      @size = 2
    elsif head_value
      @tail = @head
    else
      @head = @tail
    end
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

foo = CircularLinkedListSng.new
p foo
