# Objective: Implement merge sort without recursion

# NOTE: bottom up merge sort is a non-recursive way of doing merge sort. It does
# this by using nested loops to go over increasingly larger subarrays, starting
# with subarrays of size 1. The "merge" function here doesn't really merge; it just
# sorts in blocks of increasing width.

def merge_sort_botup(arr)
  # Create a copy of the original array; skip this step and replace result var
  # with arr if you want to mutate the original
  result = arr.dup

  # Create a var that determines the 'width' of each subarray to be sorted and merged
  i = 1
  # Run a loop until you've got a subarray the size of the original
  while i < arr.size
    # Run an inner loop that will sort and merge subarrays of size (or width) i
    j = 0
    while j < arr.size
      # j will be the left most index. Add the current width to j to get the mid
      # point. The last element's index will be the lesser of either the arr size
      # or the mid point + width. Figuring out the last index in this way will
      # prevent the situation where you end up going past the arr limits.
      first =  j
      middle = j + i
      last = [j + (i * 2), arr.size].min

      result = merge(first, middle, last, result)

      # Move up the starting point to get to the next block of width i;
      # everything before it has been sorted and merged already
      j = j + (i * 2)
    end

    # Double the width
    i *= 2
  end

  result
end

def merge(first, middle, last, arr)
  # Create a var and copy the original array. The original should not be
  # changed.
  result = arr.dup

  # Create vars that can be altered, using the inputs. The first element is held
  # in both i and j because i is used to refer to values in the original array while
  # j is used to increment through the result array
  i = first
  j = first
  k = middle

  # Loop through the result array
  while j < last
    # If the leftmost index of the original arr is less than the middle index,
    # there're still elements in the left half.
    # If the middle index is greater or equal to the last index, then the
    # right index is emptied out.
    # If the leftmost element in the original is less than or equal to the
    # middle element, then that element (and not the middle) should be in the result
    if (i < middle && (k >= last || arr[i] <= arr[k]))
      result[j] = arr[i]
      i += 1
    else
    # Otherwise, the current middle element should go into the result and the
    # middle should be moved up.
      result[j] = arr[k]
      k += 1
    end

    # Increment to continue moving down the result array
    j += 1
  end

  result
end

foo = [1,3,5,7,9,1,11,13,12]
bar = foo.shuffle
p bar
merge_sort_botup(bar)
