# Objective: Given a str and a positive integer n, construct a Caesar cipher
# that shifts any letters in the string by n spaces in the alphabet. Retain case
# for any letter-chars and do not alter any non-letter chars, including spaces.

def caesar_cypher(str, n)
  # Use ranges to build arrays of lower and upper case letters
  lowers = ("a".."z").to_a
  uppers = ("A".."Z").to_a

  # Go through each char in the original string
  result = str.chars.map { |char|
    # Check to see if the char is a letter or not by seeing if it's included in
    # one of the letter arrays.
    if lowers.include?(char)
      new_idx = (lowers.index(char) + n) % 26
      lowers[new_idx]
    elsif uppers.include?(char)
      new_idx = (uppers.index(char) + n) % 26
      uppers[new_idx]
    else
    # If the char is not a letter char, leave it alone but add it to the result
      char
    end
  }.join

  result
end

p caesar_cypher('helloZ', 1)
