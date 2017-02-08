# Objective: Implement radix sort

def radix_sort(arr, base = 10, comparator = Proc.new {|a,b| a < b})
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  raise ArgumentError, "Only positive integers are valid bases." unless base.is_a?(Integer) && base > 0
  # Cover the base cases
  return arr if arr.size <= 1

  # Get the least and greatest values
  # In Ruby, this can also be done on one line with 'min_num, max_num = arr.minmax'
  max_num = arr.max
  min_num = arr.min

  # The digits var will determine the digits place
  # This starts at 0 since the 1's place can be found by raising base by 0 for any base
  digits = 0

  # Rounds, looping through the digits from right to left
  while (max_num - min_num)/(base ** digits) > 0
    # For each loop, create a new array of buckets
    buckets = Array.new(base) { [] }

    arr.each do |el|
      # Take each element and subtract the minimum value to account for negatives.
      # Divide the difference by the base to the power of the digits var to get
      # a representation of the original number, up to the (digits + 1)-signicant digit.
      # Modulo by the base to ensure that the resulting index is within the bounds
      # of the buckets array (0 ... base); this will also give you the single digit
      # at (digits + 1) in the original number.
      bucket_index = ((el - min_num)/(base ** digits)) % base

      # Reverse the indices if the comp is a greatest to least type
      bucket_index = base - 1 - bucket_index unless comparator.yield(1,2)

      # Push the element into the buckets array at the determined index
      buckets[bucket_index] << el
      p buckets
    end

    # The buckets array will be a collection of arrays, some empty. Flatten the whole
    # thing into one array and assign it to arr. Each iteration will have a different
    # order to it and that order will affect the outcome of the next iteration.
    arr = buckets.flatten
    # Increment the digits place
    digits += 1
  end

  arr
end

p radix_sort [-100, 50, 7,0,0,0, -2000, -2100, -3, 5, 330]
