# NOTE: How I think this works: If there's a giant array, instead of running
# bsearch on the whole thing, figure out a sensible lower bound by exponentially
# increasing a 'bound' by 2. Divide that var in half for the lower bound, then
# take the smaller of arr.size and bound to use as the upper bound. This gives
# bsearch a smaller range to work with.

def exponential_search(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)
  # Cover the easy case of empty
  return nil if arr.size == 0

  # Start with a bound var of 1; I used 2 ** 0 here to emphasize that this is
  # a base 2 var
  bound = 2 ** 0

  # Exponentially increase the bound until it's either equal to or larger than the
  # array size OR the value at the bound index is equal to or larger than the target
  while bound < arr.size && arr[bound] < target do
    bound *= 2
  end

  # If the bound is larger than the array size, the value at bound will just be nil
  # so use the smaller of bound and size
  upper_bound = bound < arr.size ? bound : arr.size
  # Since upper_bound is either at or just over the target, and since bound was
  # found by multiplying by 2, the lower bound can be found by dividing by 2 once
  lower_bound = bound/2

  # Feed the bsearch the array, the target, and the upper and lower bounds to search in
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

  nil
end
