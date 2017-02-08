# Objective: Implement insertion sort

def insertion_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid args
  raise ArgumentError, "This method requires an array as the first argument." if arr.nil? || !arr.is_a?(Array)
  # Cover cases where no sorting is needed
  return arr if arr.empty? || arr.size == 1

  # Start at the second el and end at the last; Each comparison will look behind
  # the current el (to the current largest el) so starting at 0 would mean checking
  # against nil
  (1).upto(arr.size - 1) do |i|
    # Use the comparator to compare the el at index i against the el at the index
    # before i
    if comparator.yield(arr[i], arr[i - 1])
      # If the comparison yields true
      # Start at the current index, i, and work down to the second index, 1
      (i).downto(1) do |j|
        # While moving backwards, compare each el to the one behind it again
        # If the comparison yields true, swap the two els
        if comparator.yield(arr[j], arr[j - 1])
          arr[j - 1], arr[j] = arr[j], arr[j - 1]
        end
      end
    end
  end

  # Return the sorted array
  arr
end

p insertion_sort([1,3,2,5,7,6], Proc.new {|a,b| a > b})

# Time Complexity: O(N**2)
# Space Complexity: O(1)
