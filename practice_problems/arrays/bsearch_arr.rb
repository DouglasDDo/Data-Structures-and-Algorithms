# Objective: Write an algorithm answers whether an element exists in a sorted array
def bsearch_bool(arr, target)
  return false if target > arr.last || target < arr.first
  mid_idx = arr.length/2
  return true if target == arr[mid_idx]

  if target > arr[mid_idx]
    bsearch_bool(arr[mid_idx..-1], target)
  else
    bsearch_bool(arr[0...mid_idx], target)
  end
end
# Time Complexity = O(logN) where N is the size of the array

# Objective: Write an algorithm that returns the index of an element in a sorted array
def bsearch_idx(arr, target)

end

# Time Complexity = O(logN) where N is the size of the array
