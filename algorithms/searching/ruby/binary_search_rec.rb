
def binary_search_rec(arr, target, left = 0, right = nil)
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  # Initialize right limit if it hasn't been set in the arguments
  right = arr.size - 1 if right.nil?

  # Cover the cases where the target is out of bounds
  return nil if target < arr[left] || target > arr[right]

  # Find the midway point and account for dropping the left half by adding the current min
  mid_idx = left + (right - left)/2

  # Break out and return mid_idx immediately if that's where the target resides
  return mid_idx if arr[mid_idx] == target

  if target < arr[mid_idx]
    # If the target is less than arr at mid, make a recursive call on the left side
    return binary_search_rec(arr, target, left, mid_idx - 1)
  else
    # Otherwise, make a recursive call on the right
    return binary_search_rec(arr, target, mid_idx + 1, right)
  end
end

# Time Complexity: O(log2(N))

foo = [1,2,4,5]
p binary_search_rec(foo, 3)
