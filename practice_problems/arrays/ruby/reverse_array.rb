# Objec­tive: Write an algo­rithm that reverses a given array.

# Iterative approach
def itr_reverse_array1(arr)
  # Initial head point
  start_idx = 0
  # Initial tail point
  end_idx = arr.length - 1

  # Start loop and continue until and up to point when head and tail meet
  while start_idx <= end_idx
    # Use a var to hold element to be swapped
    hold = arr[start_idx]
    # Swap out head element and replace with tail element
    arr[start_idx] = arr[end_idx]
    # Set tail element to hold element
    arr[end_idx] = hold

    # Increment head point and decrement tail point
    start_idx += 1
  end_idx -= 1
  end

  # Return final arr after all swaps in the loop are completed
  arr
end

def itr_reverse_array2(arr)
  start_idx = 0
  end_idx = arr.length - 1

  while start_idx <= end_idx
    # Same approach as Iterative 1 but uses Ruby's swap syntax
    arr[start_idx], arr[end_idx] = arr[end_idx], arr[start_idx]

    start_idx += 1
  end_idx -= 1
  end

  arr
end


# Recursive approach #1
def rec_reverse_array1(arr)
  # Remove and hold the last element
  last = arr.pop
  # If the input array has more than one element, recursively call the fn
  rec_reverse_array1(arr) if arr.length > 1
  # Return the input array with the 'last' var added to the front
  # When the input arr hits 1 in length, the first element of the original arr
  # ...becomes the first element to be placed into the resulting arr and gets set as the last in the sequence
  arr.unshift(last)
end

# Recursive approach #2
def rec_reverse_array2(arr)
  # Return the array with the single remaining element if the array is of size 1 or less
  return arr if arr.size <= 1
  # Recursively call the fn on the array that results after dropping the first element
  # Use Ruby's '+' concatenation of arrays to concat the first element to the end of the result
  # ...of the recursive call; Return the result each time (done here implicitly, w/o 'return')
  rec_reverse_array2(arr.drop(1)) + arr.first(1)
end

foo = [1,2,3,4]
bar = [2,3,4,5]
zoo = %w(e, f, g, h)
zaz = %w(a, b, c, d)

p rec_reverse_array2(foo)
p rec_reverse_array1(bar)
p itr_reverse_array1(zaz)
p itr_reverse_array2(zoo)
