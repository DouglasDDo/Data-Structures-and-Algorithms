# Objective: Implement bubble sort

def bubble_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the easy cases
  return arr if arr.size <= 1

  # Initialize sorted var to false
  sorted = false

  # Run a loop until sorted is equal to true
  until sorted do
    # Set sorted to true at the start of each loop
    # If the comparisons in the loop below never yield true
    # This var will remain as true and the sort will have been fully completed
    sorted = true

    # Iterate through the indices up until the second to last one
    # The comparison will be between i and i + 1, so the indices can't go all the
    # way to the last or i + 1 will be out of bounds
    (0).upto(arr.size - 2) do |i|
      # Compare the next element to the current one
      if comparator.yield(arr[i + 1], arr[i])
        # If the comparison yields true, swap the elements
        arr[i], arr[i + 1] = arr[i + 1], arr[i]

        # Since the current and next were not sorted
        # Assume that there may be more unsorted elements
        # So set sorted back to false so that the loop may run again
        sorted = false
      end
    end
  end

  # The loop is done and the array is sorted; return it
  arr
end
p foo = [1,42,4,6,2,5,7,234,7].shuffle
p bubble_sort foo
