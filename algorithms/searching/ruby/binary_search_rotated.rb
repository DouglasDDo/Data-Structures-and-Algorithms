
def binary_search_rotated(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "The first argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array provided must contain all integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target must be an integer value." unless target.is_a?(Integer)

  # Initialize min and max indices
  min_idx = 0
  max_idx = arr.size - 1

  # Run a loop until min and max meet
  while (min_idx <= max_idx) do

    # Find the midway point and account for possiblity of increased min
    mid_idx = min_idx + (max_idx - min_idx)/2
    # Break out right away if arr at mid equals target
    return mid_idx if arr[mid_idx] == target

    # If min is less than or equal to mid, the left side is sorted
    if arr[min_idx] <= arr[mid_idx]
      # Check to see if the target is in the left side at all
      if target >= arr[min_idx] && target <= arr[mid_idx]
        # If it's in the left side, reduce the range to be min to mid - 1 and repeat the loop
        max_idx = mid_idx - 1
      else
        # The target isn't in the left at all, so the mid point can be set to the new min to
        # disregard all left side values
        min_idx = mid_idx + 1
      end
    # If the left side isn't sorted, the right side must be sorted
    # Since the right side is sorted, we can check to see if the target is within bounds
    elsif target >= arr[mid_idx] && target <= arr[max_idx]
      # If the target is within bounds, set the min to mid + 1 and continue on with
      # the loop as if going through a normal binary search
      min_idx = mid_idx + 1
    else
      # If the leftside is not sorted, but the right side doesn't contain the target,
      # the target may still reside in the left side so reduce the range to min to mid - 1
      max_idx = mid_idx - 1
    end
  end

  # This explicitly sets nil as return value if the target is not in the arr. This isn't
  # completely necessary as nil will be returned anyhow if the above loop doesn't produce
  nil
end


foo = [7,1,2,3,4,5,6]
bar = [3,4,5,6,1,2]
p binary_search_rotated(foo, 5)
p binary_search_rotated(bar, 1)
