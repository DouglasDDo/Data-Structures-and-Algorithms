# Objective: Implement comb sort

def comb_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base cases
  return arr if arr.size <= 1

  # The gap factor is the distance between any two elements being compared
  # Comb sort improves on bubble sort. Bubble sort uses a gap of 1 each time
  # it compares two elements. Comb sort uses gaps as small as 1 and up to the max gap
  # Initialize it to equal the size of the array
  gap = arr.size
  # The shrink factor is the number that's used to divide the gap in order to "shrink"
  # it. It's set to 1.3 because that's the optimal number to one decimal place
  shrink = 1.3

  # Initialize the sorted var to equal false. It will be updated in the loop
  # just like in bubble sort
  sorted = false

  # Keep looping until the array is sorted
  until sorted do
    # Shrink the gap by diving it by the shrink factor; get the floor value
    # Then choose the larger of the shrunken gap and 1
    gap = (gap/shrink).to_i > 1 ? (gap/shrink).to_i : 1

    # If the gap is larger than 1, it means that there may be more sorting to do
    # If it's less than or equal to 1, set gap to 1 (minimum gap) and set sorted to true
    # If sorting still needs to be done, it'll happen in the loop below 
    if gap <= 1
      gap = 1
      sorted = true
    end

    # Loop through increasingly large portions of the array
    # As the gap grows smaller, the range through which the loops runs through
    # grows bigger, eventually ending at the last index: array size - 1 - min gap size
    (0).upto(arr.size - 1 - gap) do |i|
      # Compare the current el with the one at i + gap
      # Swap if comparison yields true
      if comparator.yield(arr[i + gap], arr[i])
        arr[i], arr[i + gap] = arr[i + gap], arr[i]

        sorted = false
      end
    end
  end

  # The loop is done and the array is sorted so return it
  arr
end

p foo = [-1, -2, 1,42,4,6,1,2,5,7,234,7,8].shuffle
p comb_sort foo
