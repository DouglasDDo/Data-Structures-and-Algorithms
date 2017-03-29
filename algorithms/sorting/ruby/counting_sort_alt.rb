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

  result = []

  num_counts.each_with_index do |count, i|
    next if count == 0

    count.times do
      if comparator.yield(1,2)
        result.push(i + min_num)
      else
        result.unshift(i + min_num)
      end
    end
  end

  result
end

p counting_sort [1,5,5, 0, -1, 0], Proc.new {|a,b| a > b}
p counting_sort [1,5,5, 0, -1, 0]
