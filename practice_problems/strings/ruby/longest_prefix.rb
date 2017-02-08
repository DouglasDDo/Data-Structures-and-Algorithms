# Objective: Find the longest shared prefix in a string containing words separated
# by spaces

def longest_prefix(str)
  # Check for valid args
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)

  # Convert string into string array
  words = str.split(' ')
  # Get the length of a word and set it to current max length of matches;
  # Word choice doesn't matter
  max_len = words[0].length

  # Iterate through each of the words
  (1 ... words.length).each do |i|
    # Keep track of matches
    match_len = 0

    # Unnecessary to solve the problem but will conclude program without
    # having to perform operations on rest of string
    return '' unless words.first[0] == words[i][0]

    # Shorten the while loop by making sure the loop never goes beyond length of
    # current word
    max_len = match_len if words[i].length < max_len

    # Perform a while loop with two checks:
    # 1. Matches can't be equal to or greater than max length of matches so far
    # 2. Letters need to match to be counted
    while (match_len < max_len &&
           words.first[match_len] == words[i][match_len])

      # If all checks pass, increment the match count by 1
      match_len += 1
    end

    # Set the max length of matches to the count of matches
    max_len = match_len
  end

  # Take the first words and, starting from idx 0, slice the word up to max length of matches
  # Return the result
  str.slice(0,max_len)
end
