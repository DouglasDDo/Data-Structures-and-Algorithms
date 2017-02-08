# Objective: Given an array, find the largest sum that results when adding
# together elements that are contiguous

def contiguous_sum(arr)
  # If the array is empty, hand back a zero (alt.: hand back nil)
  return 0 if arr.length < 1
  # If the array only contains one element, that element is the entire sum
  return arr[0] if arr.length == 1

  # Set the current sum to 0 (alt.: set to arr[0] but this requires a lookup)
  current_sum = 0
  # Set max to the first element in the aray
  # NOTE: Do NOT set to 0, otherwise the second check in the loop will not be
  # able to account for negatives in an array containing only negatives
  max = arr[0]

  # For each element in the array, perform two checks
  arr.each do |num|
    # The current sum is the greater of the num and num + current sum
    current_sum = num >= current_sum + num ? num : num + current_sum
    # After making the check above, is the current sum greater than the max?
    # If so, max is now equal to current sum, otherwise, max remains the same
    max = current_sum >= max ? current_sum : max
  end

  max
end

foo = [4, -2, 3]

puts contiguous_sum foo
