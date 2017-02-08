# Objec­tive: Implement a Stack using a Linked List

class Node
  # Make value and next props both readable and writable
  attr_accessor :value, :next

  # Construct the node with value and next props; default both props to nil
  # This is a node for a SLL so it only needs a next prop
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  # Provide a method to return the node's value as a string
  def to_s
    "#{@value}"
  end
end

class LLStack
  # The Stack's head and size props are set to read only; writing is accomplished through setters
  attr_reader :head, :size

  # Create the Stack with either an empty head node or a head node with the value provided
  # If a value is provided, set the size to 1, else to 0
  def initialize(head_value = nil)
    @head = Node.new(head_value)
    @size = head_value ? 1 : 0
  end

  # Stacks only allow for adding to the tail; provide a push method
  def push(node_value)
    # Make a var to keep track of the current node; init with head node
    current_node = @head

    if empty?
      # If the stack is empty, just change the empty head's val to given val
      @head.value = node_value
    else
      # Otherwise, traverse the nodes while current node has a next node
      while current_node.next
        # Set the current node to its next until you reach the tail, the node with no next
        current_node = current_node.next
      end

      # Once the tail is reached, set the tail's next to a new node created with the given val
      current_node.next = Node.new(node_value)
    end

    # Increment size by 1 in all cases
    @size += 1
    # Return self to allow for chaining (or just return the tail node)
    self
  end

  # Stacks remove by LIFO (last in, first out); remove the tail
  def pop
    # Make a var to hold the current node and set it to head
    current_node = @head
    # If the current's next doesn't exist, then head is the only node so set its val to nil
    current_node.value = nil if current_node.next.nil?

    # Traverse the stack as long as the current's next has a next
    while current_node.next.next
      # Within the loop, set current to its next
      current_node = current_node.next
    end

    # At this point, current is the second to last node
    # Set the current's next to nil to destroy the reference to the tail
    current_node.next = nil

    # Decrement in all cases
    @size -= 1 if size > 0
    # Return self to chain or return old tail
    self
  end

  def include?(node_value)
    # Make a var to hold the current node and set it to head
    current_node = @head

    # Traverse the stack so long as current exists and has a non-nil value
    while current_node
      # Check to see if current's val equals target; return true if it does
      return true if current_node.value == node_value
      # Otherwise set the current to its next and loop back
      current_node = current_node.next
    end

    # If the loop above did not find anything, the value is not there so return false
    false
  end

  # Find the value at the given index and return it; return false if does not exist
  def value_at(index)
    # If the given index is negative, add it to size to get the index's positive equivalent
    index = size + index if index < 0
    # If the index provided is out of bounds or the stack is empty, return false for does not exist
    return false if index >= size || index < 0 || empty?

    # Create a var to hold the current and init it to head
    current_node = @head

    # Traverse the stack so long as index - 1 doesn't drop below 0
    # You subtract 1 to mimic an Enumerable index, i.e. index starting at 0
    # The index value will decrease but with each decrement the current moves forward
    while index - 1 >= 0
      # If the loop is running that means that there are still next nodes
      # Set the current to its next
      current_node = current_node.next
      # Decrement the index
      index -= 1
    end

    # The current is pointing to the node at the given index; return its value
    current_node.value
  end

  def display
    current_node = @head
    index = 0
    result = ""

    while index < size
      result += current_node.to_s + " "
      current_node = current_node.next
      index += 1
    end

    result.strip
  end

  def size
    @size
  end

  def empty?
    @size == 0
  end
end

foo = LLStack.new
# foo.push(1)
foo.push(1).push(2).push(3).push(4).pop
p foo.include? 2
p foo.value_at(-1)
# p foo.include? 1

p foo.display
