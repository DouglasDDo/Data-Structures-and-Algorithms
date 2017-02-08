
def exponential_search(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  return nil if arr.size == 0

  bound = 2 ** 0

  while bound < arr.size && arr[bound] < target do
    bound *= 2
  end

  upper_bound = bound < arr.size ? bound : arr.size
  lower_bound = bound/2

  return binary_search(arr, target, lower_bound, upper_bound)
end

# A binary search implementation that allows min and max indices to be set upon call
def binary_search(arr, target, min_idx, max_idx)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  return nil if arr.size == 0
  return nil if target < arr[min_idx] || target > arr[max_idx]

  while min_idx <= max_idx do
    mid_idx = min_idx + (max_idx - min_idx)/2

    return mid_idx if arr[mid_idx] == target

    if target < arr[mid_idx]
      max_idx = mid_idx - 1
    else
      min_idx = mid_idx + 1
    end
  end
end
