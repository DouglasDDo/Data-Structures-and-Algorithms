# Objective: Implement heap sort

def heap_sort(arr, comparator = Proc.new {|a,b| a < b})
  # The last parent in the heap is halfway through the heap
  # Go to the last parent and heapify down
  # Keep moving up and heapify down at each node
  (arr.size/2).downto(0) do |i|
    heapify_down(arr, i, comparator)
  end

  # Return the sorted heap
  arr
end

def heapify_down(arr, current_idx, comparator)
  # Run a loop
  loop do
    # Given the current index, find its L and R children
    # Temporarily assign the L child to the "next" index
    # The next index will become the current index on the next iteration
    left_idx = ((current_idx + 1) * 2) - 1
    right_idx = left_idx + 1
    next_idx = left_idx

    # If the L index is out of bounds, break
    break if left_idx >= arr.size

    # If there is a right child
    if right_idx < arr.size
      # Check to see whether the comparator yields true for R -> L
      # If true, set the next index to R index's value
      next_idx = right_idx if comparator.yield(arr[right_idx], arr[left_idx])
    end

    # If the current and next indices already satisfy the heap rules, break
    break if comparator.yield(arr[current_idx], arr[next_idx])

    # If the current and next violate heap rules, swap them
    arr[current_idx], arr[next_idx] = arr[next_idx], arr[current_idx]

    # Set the current to the next and loop back
    current_idx = next_idx
  end
end

foo = [5,4,2,7,8,1,19,3,11,6].shuffle
p heap_sort foo
