# Objective: Implement merge sort

def merge_sort(arr, comparator = Proc.new {|a,b| a <= b})
  # Ensure valid args
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base case
  return arr if arr.size <= 1

  # Grab the mid index of the array
  mid = arr.size/2

  # Recursively call merge sort on the first half of the array, then the second half
  # Use merge to combine the results of the recursive calls
  merge(merge_sort(arr[0 ... mid]), merge_sort(arr[mid ... arr.size]))
end

def merge(left, right, comparator = Proc.new {|a,b| a <= b})
  # Create a new empty array to hold the result
  result = []
  # Run a loop until all elements of either the left or right array are emptied
  until left.size == 0 || right.size == 0 do
    # Compare the first element in the left and right arrays
    # Take the lowest/greatest of the two and push it onto the result
    # Repeat as necessary until the break condition is satisfied
    result << (comparator.yield(left[0], right[0]) ? left.shift : right.shift)
  end

  # Concat the left then right (order doesn't really matter) onto the result
  # Return the resulting array
  result.concat(left).concat(right)
end

foo = [1,3,5,7,9,1,11,13,12]
bar = foo.shuffle
p bar
p merge_sort(bar)
