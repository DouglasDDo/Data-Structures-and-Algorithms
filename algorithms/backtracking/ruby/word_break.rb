# Objective: Given a string input and a dictionary of words, if the word is entirely
# composed of words from the dictionary, return a space-separated string of words;
# Otherwise, return nil. Use recursive backtracking to arrive at the solution.

def word_break(str, dict)
  # Cover invalid arguments
  raise ArgumentError, "Non-string argument(s) provided." unless str.is_a?(String)
  raise ArgumentError, "Non-string components in dictionary." unless dict.all? { |word| word.is_a?(String) }

  # Return the input if the entire thing is a word in the dict already
  return str if dict.include?(str)
  # Keep track of the endpoint with the str length
  len = str.length

  # Iterate from 1 to length, use the numbers for slice lengths
  (1 ... len).each do |i|
    # Take a substring, str[0...i]
    substring = str[0...i]

    # See if the dict holds the substring as a word
    if dict.include?(substring)
      # If the dict has the substring, slice off the remainder of the str
      remaining = str[i...len]

      # Make a recursive call on the remainder and assign it to a var
      words = word_break(remaining, dict)

      # If the var returns nil, the str is not made up of dict words
      unless words.nil?
        # Otherwise, return the substring, a space, and the rest of the words in a string
        return "#{substring} #{words}"
      end
    end
  end

  # Return nil if the dict doesn't contain the remainder
  nil
end

foo = ["foo", "bar", "boo", "cat"]
p word_break "foobar", foo

# Time Complexity: O(2 ** n)
