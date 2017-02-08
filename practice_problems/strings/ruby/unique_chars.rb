# Objective: Determine whether a string contains all unique characters

def unique_chars?(str)
  # Cover the situation where the argument is not a string
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)

  # Sort the chars of the string alphabetically
  sorted = str.chars.sort

  # From the first to the second to last element
  (0 ... str.length - 1).each do |i|
    # Check to see if the current element is equal to the next element
    # Return false if there's a match
    return false if sorted[i] == sorted[i + 1]
  end

  # No matches, all unique, return true
  true
end
