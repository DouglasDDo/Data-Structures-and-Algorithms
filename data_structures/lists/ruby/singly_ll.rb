# Objec­tive: Implement a Singly Linked List

class Node
  # Node properties must be both readable and writable
  attr_accessor :value, :next
  # Construct a node with a value store and a link to the next node
  # As it's a Singly LL, the node only contains a 'next' pointer
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  # Provide a method to see a stringified version of a node's value
  def to_s
    "#{@value}"
  end
end

class SinglyLinkedList
  # LL properties only need to be readable; writing occurs through LL methods
  # NOTE: You can still assign values to the LL's nodes' properties directly
  attr_reader :head, :size

  # Construct the SLL with a Node object as head; set head val to nil default
  # The head must always be there; do not default the entire head to nil; the node's value
  # is either set or is nil, but a node is always present
  def initialize(head_value = nil)
    @head = Node.new(head_value)
    @size = head_value ? 1 : 0
  end

  # Set a node with the given value as the new head, move the current head up in the SLL
  def insert_head(node_value)
    # If the SLL is empty, create a node with the given value and set it to head
    if empty?
      @head = Node.new(node_value)
    else
    # Otherwise, hold the head in a temporary var
      hold = @head
      # Create a new node and set it as the head
      @head = Node.new(node_value)
      # Set the next prop on the new head to point to the hold var
      @head.next = hold
    end

    # Increment size by 1, regardless of how many nodes exist
    @size += 1
    # Return the new head; alternatively, return self to make the methods chainable
    @head
  end

  # Set a node with the given value as the last node in the SLL
  def insert_tail(node_value)
    # Create a var to hold the current_node; init with head
    current_node = @head

    # If the SLL is empty, the head and tail are the same thing, set head to new node
    if empty?
      @head = Node.new(node_value)
    else
    # Otherwise, while there's another node after the current, i.e., while current is not tail
      while current_node.next
        # Get the current's next and set as the new current
        current_node = current_node.next
      end

      # The previous loop has ended, meaning current now points to tail
      # Set the current's next to the new node
      current_node.next = Node.new(node_value)
      # Move the pointer to the next node which was just inserted so that it can be returned
      current_node = current_node.next
    end

    # Increment size by 1, regardless of SLL size
    @size += 1
    # Return the current, which now points to tail
    current_node
  end

  # Remove the head of the SLL
  def delete_head
    # If the SLL is empty, there's nothing there other than an empty head; return it
    if empty?
      return @head
    elsif @head.next
    # If the head node has a next
    # Set the head to the original head's next, destroying any reference to the original
      @head = @head.next
    else
    # If the head is the only node, just set its value to nil
      @head.value = nil
    end

    # Decrement the SLL by 1 in all cases
    @size -= 1 if size > 0
    # Return the new or empty head
    @head
  end

  # Remove the last node of the SLL
  def delete_tail
    # Create a var to hold the current_node; init with head
    current_node = @head

    # If the SLL is empty, there's nothing there other than an empty head; return it
    if empty?
      return @head
    elsif @head.next
    # If the head node has a next
    # AND if that next has a next
      while current_node.next.next
        # Reassign current node to point to its next until current is second to last node
        current_node = current_node.next
      end

      # Current is now second to last node
      # Set current's next to nil, destroying the reference to the last node, the tail
      current_node.next = nil
    else
    # If there's just one node, it's both head and tail, set its value to nil
      @head.value = nil
    end

    # Decrement in all cases
    @size -= 1 if size > 0
    # Return the new tail or an empty head
    current_node
  end

  def include?(node_value)
    # Create a var to hold the current_node; init with head
    current_node = @head

    # Run a loop while current is not nil and while current's value is not nil
    # NOTE: The current_node condition checks for existence of node in case next node is nil
    while current_node && current_node.value
      # Return true, for found, if current value is target value
      return true if current_node.value == node_value
      # Otherwise, set current to its next
      current_node = current_node.next
    end

    # If the target value wasn't found during the loop run, then it's not there, return false, for not found
    false
  end

  # Display the value of each node
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

  # Return the size of the SLL
  def size
    @size
  end

  def empty?
    @size == 0
  end
end

foo = SinglyLinkedList.new
foo.insert_head 3
foo.insert_head 2
foo.insert_head 1
foo.insert_tail 4
foo.insert_tail 5
p foo.include?(1)
foo.display
