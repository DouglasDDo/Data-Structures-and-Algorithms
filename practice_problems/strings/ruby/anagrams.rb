# Objective: Given two strings, determine if they are anagrams of each other

def anagrams?(str1, str2)
  # Cover the situation where either argument is not a string
  raise ArgumentError, "Non-string argument(s) used." unless str1.is_a?(String) && str2.is_a?(String)
  # Strip out any non-alphabet chars and convert to all lowercase
  stripped_1, stripped_2 = str1.downcase.scan(/[a-z]/).join, str2.downcase.scan(/[a-z]/).join
  # If the two are not of the same length
  return false unless stripped_1.length == stripped_2.length

  # NOTE: extremely easy way to solve but commenting out for more involved solution
  # stripped_1.chars.sort == stripped_2.chars.sort

  # Create a new hash with default values of 0 to track chars
  hashed = Hash.new(0)

  # For each char in str1 create or add to a key and increment value by 1
  stripped_1.chars.each do |char|
    hashed[char] += 1
  end

  # For each char in str2, find or make it's key and decrement by 1
  stripped_2.chars.each do |char|
    hashed[char] -= 1
  end

  # Go through the values and make sure they all equal to 0, return false otherwise
  hashed.each_value {|val| return false unless val == 0 }

  # Everything matches so the strings are anagrams
  true
end

# Time Complexity: O(N)
