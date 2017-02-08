# Objective: Given a dictionary and a string, determine whether the string can
# be formed entirely from words from the dictionary

def word_breakable?(str, dict)
  raise ArgumentError, "Non-string argument(s) provided." unless str.is_a?(String)
  raise ArgumentError, "Non-string components in dictionary." unless dict.all? { |word| word.is_a?(String) }
  # Base case and also the case if the initial str is a single word in the dict
  return true if dict.include?(str)
  # Keep track of the endpoint of the str by using its length
  len = str.length

  # Start with 1 because we are using slice
  # Iterate through the str's length
  (1 ... len).each do |i|
    # Slice off a substring from 0 to i
    first = str.slice(0, i)
    # If the substring is a word in the dict
    if dict.include?(first)
      # Break off the remaining portion of the str
      remaining = str.slice(i, len)
      # Return the recursive call on the remaining
      return word_breakable?(remaining, dict)
    end
  end

  # If the str is made up of words in the dict, the loop will have
  # returned true due to the base case being reached
  # Otherwise, the loop has completed and the remaining substring is not
  # composed of dict words so return false
  false
end

foo = ["foo", "bar", "boo", "cat"]
p word_breakable?('cfootbar', foo)
