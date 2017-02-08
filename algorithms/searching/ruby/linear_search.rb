
def linear_search(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  # Loop over the index values
  (0).upto(arr.size - 1) do |i|
    # If array at index i is equal to target, return i
    return i if arr[i] == target
  end

  # If the target hasn't been found, return nil
  nil
end

# Time Complexity: O(N)
