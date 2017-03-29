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
    # If the char is a letter, find its ASCII code, add the shift factor in,
    # and then mod it by z's or Z's ASCII code. Finally, convert the shifted
    # ASCII code back into a letter using #chr()
    if lowers.include?(char)
      (char.ord + n) > "z".ord ? ((char.ord + n) % "z".ord + "a".ord - 1).chr : (char.ord + n).chr
    elsif uppers.include?(char)
      (char.ord + n) > "Z".ord ? ((char.ord + n) % "Z".ord + "A".ord - 1).chr : (char.ord + n).chr
    else
    # If the char is not a letter char, leave it alone but add it to the result
      char
    end
  }.join

  result
end

p caesar_cypher('helloZ', 1)
