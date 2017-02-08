# Objective: Implement quick sort

def quick_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base cases
  return arr if arr.size <= 1

  # Choose a random index on the array
  pivot = rand(0 ... arr.size)
  # Keep empty arrays to store sorted elements
  left = []
  right = []

  # From index 0 to the last index
  (0).upto(arr.size - 1) do |i|
    # Skip to the next iteration if i is the same as pivot
    # The pivot will be concat'ed manually so there's no need to push it here
    next if i == pivot
    # Compare the el at pivot against the el at i
    # If comparison yields true, push it onto the left arr
    # Otherwise, push it onto the right
    # The full run of quick_sort will run this loop on increasingly smaller
    # subarrays until the subarrays are all sorted
    comparator.yield(arr[i], arr[pivot]) ? left << arr[i] : right << arr[i]
  end

  # Recursively call the fn on the left side
  # Add in the pivot element
  # Recursively call the fn on the right side
  # concat the left to the pivot to the right and return the result
  quick_sort(left, comparator).concat([arr[pivot]]).concat(quick_sort(right, comparator))
end

p foo = [1,42,4,6,2,5,7,234,7].shuffle
p quick_sort foo
