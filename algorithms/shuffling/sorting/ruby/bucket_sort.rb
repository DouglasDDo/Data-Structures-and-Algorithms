# Objective: Implement bucket sort

def bucket_sort(arr, bucket_divisor = 5, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base cases
  return arr if arr.size <= 1

  # Grab the highest and lowest values in the array
  max_num = arr.max
  min_num = arr.min

  # There will always be one bucket, hence the + 1.
  # The count gets increased by however many multiples of bucket_divisor make up
  # the arr size. The idea is to break down the entire array into subarrays or
  # buckets and sort those
  buckets_count = ((max_num - min_num)/bucket_divisor).floor + 1
  # Make an array of empty arrays the size of buckets_count
  buckets = Array.new(buckets_count){ [] }

  # ceil(max + 1)/buckets_count

  # Iterate through the elements in the array
  (0).upto(arr.size - 1) do |i|
    # Subtract the min number from the element at i, to account for negatives
    # Divide the difference using the bucket_divisor
    # Each bucket will have elements grouped by the quotient
    buckets[((arr[i] - min_num)/bucket_divisor).floor].push arr[i]
  end

  current_idx = comparator.yield(1,2) ? 0 : arr.size

  buckets.each do |bucket|
    # Sort each bucket using insertion sort
    insert_sort(bucket, comparator)

    # If yield is true, place values least to greatest
    if comparator.yield(1,2)
      # Replace values starting at the beginning
      arr[current_idx ... current_idx + bucket.size] = bucket
      # Update the current to move higher up the array
      current_idx += bucket.size
    # If yield is false, greatest to least
    else
      # Replace arr values starting at the end
      arr[current_idx - bucket.size ... current_idx] = bucket
      # Update the current to move lower down the array
      current_idx -= bucket.size
    end
  end

  arr
end

# Time Complexity: O(N**2)
# Space Complexity: O(N + k)

# p foo = [-1, 1,2,6,7,8,9,110,111, -5].shuffle
# p bucket_sort foo


def insert_sort(arr, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the base cases
  return arr if arr.size <= 1

  (1).upto(arr.size - 1) do |i|
    if comparator.yield(arr[i], arr[i - 1])
      (i).downto(1) do |j|
        if comparator.yield(arr[j], arr[j - 1])
          arr[j], arr[j - 1] = arr[j - 1], arr[j]
        end
      end
    end
  end

  arr
end


bar = [0,1,2,3,-10,-9, -4,4,5,6,9,10,24,6,6,6,].shuffle
p bucket_sort bar, 5, Proc.new {|a,b| a > b}
p bucket_sort bar
