# Objective: Using recursion, print all permutations of a string

def string_perms(str)
  raise ArgumentError, "Non-string input used." unless str.is_a?(String)
  # base case: the loop below will work with increasingly smaller versions of the
  # string
  return [str] if str.length < 2

  # Grab the first letter of each str input.
  # This will be used to insert into substrings.
  letter = str[0]

  # Make a recursive call on the substring after the first letter.
  # #each_with_object returns an array, so with each array that comes back,
  # run #each_with_object, using an empty array for the memo.
  # The result gets built after hitting the last letter. The substring before that
  # will have saved the letter before it which gets inserted in front and behind
  # the last letter. This continues on with larger substrings until the entire
  # result is built.
  string_perms(str[1 .. -1]).each_with_object([]) do | substr, memo |
    # Go through the indices of the substring, plus one over the last index.
    # #insert is able to use last + 1 to insert an item one index beyond the
    # limit of an Enumerable.
    (1 .. substr.length).each do |idx|
      # Create a duplicate of the substring so that each iteration can work
      # with the original. Use the insert method to place the letter at ever index
      # and the index that comes after the limit.
      memo << substr.dup.insert(idx, letter)
    end
  end

  # each_with_object returns an array, the memo, and the final one that comes
  # back will hold all the permutations
end

p string_perms 'abc'
