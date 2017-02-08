# Objective: Implement a shuffle using random assignment of indices

# Import the securerandom class
require 'securerandom'

def random_shuffle(arr)
  # Ensure valid argument
  raise ArgumentError, "The argument given must be an Array" unless arr.is_a?(Array)
  # Cover the easy cases
  return arr if arr.size <= 1

  # Create an empty hash to hold indices and uuids
  uuid_hash = Hash.new

  # Generate a new uuid for each key in the array and save these pairs to the hash
  (0).upto(arr.size - 1) do |i|
    uuid_hash[i] = SecureRandom.uuid
  end

  # Make an array out of the hash and sort that array by the uuids
  sorted_indices = uuid_hash.sort_by {|k,v| v}
  # Make a holding var to keep shuffled array values
  result = []

  # Go through each of the sorted indices
  (0).upto(arr.size - 1) do |i|
    # Grab the first value, which will have been the original array's indices
    new_idx = sorted_indices[i].first
    # Set the value in result at i to equal the array at each new index
    result[i] = arr[new_idx]
  end

  # Assign result to original and return
  arr = result
end

p random_shuffle [1,2,3,4,5]
