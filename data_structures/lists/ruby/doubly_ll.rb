# Objective: Implement a Doubly Linked List

class Node
  # Make the node props available for both read and write operations
  attr_accessor :value, :next, :prev

  # Init with value, next, and prev props; default to nil for all
  def initialize(value = nil, next_node = nil, prev_node = nil)
    @value = value
    @next = next_node
    @prev = prev_node
  end

  # Provide a method to stringify the node value
  def to_s
    "#{@value}"
  end
end

class DoublyLinkedList
  # LL props need only read accessability; writing is done through methods
  attr_reader :head, :tail, :size

  # Init with head, tail, and size props
  # LL should not be completely empty. LL empty state just means there's a
  # node with nil values as its head (and tail)
  # NOTE: If only head or only tail is given, an extra object is created but later replaced
  def initialize(head_value = nil, tail_value = nil)
    @head = Node.new(head_value)
    @tail = Node.new(tail_value)
    # If either, but not both, head or tail is nil set size to 1; otherwise 0
    @size = (head_value ^ tail_value) ? 1 : 0


    # If both head and tail vals are provided
    if head_value && tail_value
      # The head and tail props are already set, so now just set the next on head to tail
      @head.next = @tail
      # and set the prev no tail to head
      @tail.prev = @head
      # The XOR check on size set it to 0 so here is where actual size is set under these conds
      @size = 2
    elsif head_value
      # If only the head val is given, the head is set so this is where tail is set
      @tail = @head
    else
      # In this case, no head was given, but a tail was; set head to the tail node
      @head = @tail
    end
  end

  # Add a new tail
  def push(node_value)
    new_node = Node.new(node_value)

    # Steps to run if DLL is empty
    if empty?
      # Set both head and tail to the new node
      @head = new_node
      @tail = new_node
    else
      # If DLL is not empty, start by setting new node's prev to current tail
      new_node.prev = @tail
      # Update the current tail to have new node as its next
      @tail.next = new_node
      # Have tail point to the new node, the true tail now
      @tail = new_node
    end

    # Increment size in all cases
    @size += 1
    # Return self for chaining
    self
  end

  # Remove the tail
  def pop
    if size > 1
      @tail = @tail.prev
      @tail.next = nil
    elsif size == 1
      @head.value = nil
    end

    # If size is 0, nothing needs to be done and none of the above runs
    # Decrement size in all non-zero cases
    @size -= 1 if size > 0
    # Returns self so it can be chained; Can return the popped value, alternatively
    self
  end

  # Add a new head
  def unshift(node_value)
    # Start by creating a new node and assigning it to a var
    new_node = Node.new(node_value)

    #
    if empty?
      # If DLL is empty, set both head and tail to new node
      @head = new_node
      @tail = new_node
    else
      # If DLL contains one or more nodes, hold the head in a var
      hold = @head
      # Set the prev of the new head var to the new node
      hold.prev = new_node
      # Set the head prop to the new node as well
      @head = new_node
      # Set the head prop's next to the old head
      @head.next = hold
    end

    # Increment size in all cases
    @size += 1
    # Return self for chaining
    self
  end

  # Remove the head
  def shift

    if size > 1
      # If there's 2 or more nodes,
      # First set the head to its next
      @head = @head.next
      # The new head still holds a reference to the original head, so make it nil
      @head.prev = nil
    elsif @size == 1
      # If there's only one node, just set its val to nil
      @head.value = nil
    end

    # Decrement size except when the DLL is empty
    @size -= 1 if size > 0
    # Return self for chaining or, alternatively, the original head
    self
  end

  def include?(node_value)
    # If the DLL is empty then we know there's no way the given value exists
    return false if empty?

    # The DLL is not empty so track current with a var and set it to head
    current_node = @head

    # You check for existence of the node because inside the loop the current can get
    # set to nil if the previous current node's next is nil; Normally you'd check for
    # value but if the next is nil then you'd be checking for value prop on nil
    while current_node
      # Check if current's val is equal to target val; return true if so
      return true if current_node.value == node_value
      # Otherwise, set current to its next
      current_node = current_node.next
    end

    # If the loop above didn't find the target, it isn't in the DLL so return false
    false
  end

  def value_at(index)
    # If the index given is negative, add it to size to get its positive equivalent
    index = index + size if index < 0
    # If either the index is out of bounds or the list is empty, return false
    return false if index >= size || index < 0 || empty?
    # Track the current and init it withs head
    current_node = @head


    # Traverse the nodes until index - 1 is negative
    while index - 1 >= 0
      # The node at the given index hasn't been reached yet so move current pointer to its next
      current_node = current_node.next
      # Decrement the index
      index -= 1
    end

    # The node at the given index has been reached; return its value
    current_node.value
  end

  def display
    # Track the current and set it to head
    current_node = @head
    # Init the index at 0 since we'll be starting at the head
    index = 0
    # Init the result to empty string
    result = ""

    # Traverse the entire array, i.e., go through all indices and stop when it equals size
    while index < size
      # Concat the stringified value of the current to the result
      result += current_node.to_s + " "
      # Move the current pointer to point to its next
      current_node = current_node.next
      # Increment the index
      index += 1
    end

    # Return the result and remove white spaces on the ends
    result.strip
  end

  def size
    @size
  end

  def empty?
    @size == 0
  end
end

foo = DoublyLinkedList.new()
# foo.push(2)
# foo.push(3)
# foo.unshift(1)
# # foo.shift
# # foo.shift
p foo.value_at 0
# p foo.display
# foo.push(2)
# foo.push 3
# foo.pop
p foo.include? 0
p foo
