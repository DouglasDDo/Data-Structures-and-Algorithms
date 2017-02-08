# Objective: Determine whether two strings are permutations of each other

def two_perms(str1, str2)
  # Ensure valid args
  raise ArgumentError, "Non-string argument(s) used." unless str1.is_a?(String) && str2.is_a?(String)
  # Skip the heavy work if the two are of different lengths
  return false unless str1.length == str2.length

  # Create an empty hash to keep track of letters
  hash = Hash.new(0)

  # Make keys out of each letter in each string
  # Increment the count for each letter
  str1.each_char do |char|
    hash[char] += 1
  end

  str2.each_char do |char|
    hash[char] += 1
  end

  # If a letter appears in both words, the count will be even
  # If a letter only appears in one word, the count will be odd
  # Break out of the function if there's an odd value; Return false
  hash.each_value do |val|
    return false if val.odd?
  end

  # Return true if the hash check hasn't returned false
  true
end
