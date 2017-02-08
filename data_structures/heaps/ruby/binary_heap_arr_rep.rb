# Objective: Implement a min/max heap using an array-representation of nodes

# Defaults to min heap; Pass in a > b proc for max heap
class Heap
  attr_reader :nodes
  def initialize(opts = {})
    @comparator = opts.fetch(:comparator, Proc.new {|a,b| a < b})
    @nodes = Heap.build_heap!(opts.fetch(:nodes, Array.new), @comparator)
  end

  def peek
    @nodes.first
  end

  def empty?
    @nodes.empty?
  end

  def size
    @nodes.size
  end

  #
  def insert(new_node)
    @nodes << new_node

    heapify_up

    @nodes
  end

  alias :push :insert

  # Default: Remove and return root
  # With args: Remove and return node at given index
  def extract(current_idx = 0)
    # Cover the empty case
    return nil if empty?

    # Account for negative indexes
    current_idx = current_idx < 0 ? size + current_idx : current_idx
    raise ArgumentError, "The index provided is out of bounds." if current_idx >= size

    # Cover the easy case of just one el
    return @nodes.shift if size == 1

    # Assign extracted node to a var for returning
    # Pop off the last leaf node and assign its value to current index node
    extracted_node, @nodes[current_idx] = @nodes[current_idx], @nodes.pop

    Heap.heapify_down!(current_idx, @nodes, @comparator)

    # Return the extracted node
    extracted_node
  end

  alias :shift :extract

  # TODO: Implement later
  def update_at(index, value)
  end

  # Join two heaps to form a valid new heap but preserve the original two
  def self.merge(heap_1, heap_2, comparator = Proc.new {|a,b| a < b})
    all_nodes = heap_1.nodes.dup.concat(heap_2.nodes)
    Heap.new(nodes: all_nodes, comparator: comparator)
  end

  protected

  # Defaults to last index but can use input for updating node
  def heapify_up(current_idx = size - 1)
    # Account for negative indexes
    current_idx = current_idx < 0 ? size + current_idx : current_idx
    raise ArgumentError, "The index provided is out of bounds." if current_idx >= size

    while current_idx > 0
      # Formula for parent index of any child node: P(i) = ((i + 1) / 2) - 1
      # parent_idx = ((current_idx + 1) / 2).floor - 1
      parent_idx = ((current_idx + 1) / 2) - 1

      # Based on outcome of yielding comparator
      if @comparator.yield(@nodes[current_idx], @nodes[parent_idx])
        # Swap the positions
        @nodes[current_idx], @nodes[parent_idx] = @nodes[parent_idx], @nodes[current_idx]
        # Set current index to previous parent index so that the process
        # can continue and check with the parent node
        current_idx = parent_idx
      else
        # Break out of the loop if comparator yields false
        break
      end
    end
  end

  # NOTE: I made this a class method because I wanted to use the same logic
  # in the Heap.build_heap! method without having to repeat myself
  def self.heapify_down!(current_idx, arr, comparator)
    loop do
      # Formula for left child index of any node: L(i) = ((i + 1) * 2) - 1
      left_idx = ((current_idx + 1) * 2) - 1
      # Formula for right child index of any node: R(i) = L(i) + 1
      right_idx = left_idx + 1
      # Assign left index as the default next node
      next_idx = left_idx
      # Exit loop if left index is out of bounds
      break if left_idx >= arr.size

      # If there is a valid right index, we need to compare it with the left index
      if right_idx < arr.size
        # If max & right node > left node OR
        # If min & right node < left node
        # Assign right index to next index
        next_idx = right_idx if comparator.yield(arr[right_idx], arr[left_idx])
      end

      # Before any swap
      # If max & current > next OR
      # If min & current < next
      # Exit loop
      break if comparator.yield(arr[current_idx], arr[next_idx])
      # Swap current and next
      arr[next_idx], arr[current_idx] = arr[current_idx], arr[next_idx]

      # Set current to next and loop back
      current_idx = next_idx
    end
  end

  def self.build_heap!(arr, comparator = Proc.new {|a,b| a < b})
    raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
    return arr if arr.size <= 1

    # Heapify down, moving up in the heap, starting at the last parent
    (arr.size/2).downto(0) do |i|
      current_idx = i
      Heap.heapify_down!(current_idx, arr, comparator)
    end

    arr
  end
end

min = {nodes: [1,2,3,4,9,5,10,14,6]}
max = {nodes: [6, 14, 10, 5, 9, 4, 3, 2, 1], comparator: Proc.new {|a,b| a > b}}
unsorted = {nodes: [5,4,2,7,8,1]}

maxHeap = Heap.new(max)
minHeap = Heap.new(min)
randomMinHeap = Heap.new(unsorted)
p maxHeap.nodes
maxHeap.update_at(1,2)
p randomMinHeap.nodes
