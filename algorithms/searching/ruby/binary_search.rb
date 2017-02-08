
def binary_search(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  # Cover the cases where the target is out of bounds
  return nil if target < arr[0] || target > arr[-1]

  # Grab the indices of the least and greatest
  min_idx = 0
  max_idx = arr.size - 1

  # Set a loop going and inside of it either reduce max or increase min until
  # either he two are equal to each other or the target is found
  while (min_idx <= max_idx) do
    # Find the midway point between min and max
    # Account for left hand changes by adding min_idx
    mid_idx = min_idx + (max_idx - min_idx)/2

    # Check to see if the mid point equals target
    return mid_idx if arr[mid_idx] == target

    if target < arr[mid_idx]
      # If the target is less than the mid value, we can disregard the right side by
      # setting the max to equal one less than mid
      max_idx = mid_idx - 1
    else
      # Otherwise, disregard the left side by setting min to mid + 1
      min_idx = mid_idx + 1
    end
  end
end

# Time Complexity: O(log2(N))

foo = [1,2,3,5]
p binary_search(foo, 4)
