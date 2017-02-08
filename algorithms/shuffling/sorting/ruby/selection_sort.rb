# Objective: Implement selection sort

def selection_sort(arr)
  # Loop over the array one less than its length
  (arr.size - 1).times do |i|
    # Hold the index for the current smallest value for each iteration
    # This always begins at the left most element of the subarray
    idx = i

    # Loop through the subarray, starting with the element after i, ending at the last
    (i + 1).upto(arr.size - 1) do |j|
      # Update the current smallest value if conditions apply
      idx = j if arr[j] < arr[idx]
    end

    # Swap the elements
    arr[i], arr[idx] = arr[idx], arr[i]
  end

  # Return the sorted array
  arr
end

# Time Complexity: O(N**2)

foo = [1,3,5,7,9,11,13]
bar = foo.shuffle
p bar
p selection_sort(bar)
