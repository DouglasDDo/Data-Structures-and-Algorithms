# Objective: Return all permutations of a string

def rec_perms(str)
  # Ensure valid args
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)
  # Base case
  return [str] if str.length < 2

  # Pick out the first letter and assign it
  char = str[0]

  # For the second char, through to the last
  # Make a recursive call to the function (rec_perms)
  # The function returns an Enumerable array
  # So when it hands back an array, go through each value
  rec_perms(str[1..-1]).each_with_object([]) do |val, col|
    # And set indices from 0 up to and including the value's size
    # And insert the char at those indices for each value
    # Push/shovel the changed value (or its dup) into the collection/memo (col)
    (0..val.size).each { |idx| col << val.dup.insert(idx,char) }
  end

  # each_with_object will return the collection once it's finished
end

p rec_perms 'abcd'

# TODO: Non-recursive approach
