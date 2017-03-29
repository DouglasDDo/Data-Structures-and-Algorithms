# Objective: Implement counting sort

def counting_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base cases
  return arr if arr.size <= 1

  # Grab the highest and lowest values in the array
  max_num = arr.max
  min_num = arr.min
  # Make a new array to store the number of times each el appears in the original
  # Make the length of the new array equal to the difference between max and min
  # then add 1 to offset the 0 index
  # The reason why a max - min difference is used is to account for negative els
  num_counts = Array.new(max_num - min_num + 1) { 0 }

  # Iterate through the original array and count each occurence
  arr.each do |el|
    # The element value minus the min will give you the correct index on
    # the counting array; this is how negative numbers are accounted for
    num_counts[el - min_num] += 1
  end

  # Initialize an index var at 0 for least-to-greatest, last idx for opposite
  current_idx = comparator.yield(1,2) ? 0 : arr.size

  # Start at the min and go up to the max
  (min_num).upto(max_num) do |i|
    # Grab the count for each i (numbers betwen min and max)
    single_count = num_counts[i - min_num]
    # There might be nil values (i not found in arr) so skip them if they show up
    next if single_count.nil? || single_count == 0

    if comparator.yield(1,2)
      # Replace the range of the arr between the current index and its sum
      # after adding single element count. Multiple the element in an array
      # by its count. Use the result as the replacement
      arr[current_idx ... current_idx + single_count] = [i] * single_count
      # Update the current index by adding single count to it
      current_idx += single_count
    else
      # Greatest to least goes backwards, so move back single count spaces
      # and end at current
      arr[current_idx - single_count ... current_idx] = [i] * single_count
      # Update the current
      current_idx -= single_count
    end
  end

  arr
end

p counting_sort [1,5,5, 0, -1, 0], Proc.new {|a,b| a > b}
p counting_sort [1,5,5, 0, -1, 0]
