# Objective: You have 100 cats and 100 hats. On each pass over the cats, if a
# cat is not wearing a hat, you place a hat on it. If the cat is wearing a hat,
# you remove the hat it's wearing. On the first pass, you check every cat (1,2,3..100).
# On the second pass, you check every second cat (2,4,6..100). On the third pass,
# you check every third cat and so on until you check only the 100th cat.
# Write a fn that returns which cats still have hats after the final pass.

def cats_in_hats(n = 100)
  # Ensure proper args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0
  # Create an empty array to store the results
  result = []

  #
  i = 1

  # Based on the rules, we know that if a cat is check an odd number of times,
  # it will have a hat on. Also, because of how the cats are checked, we know that
  # only cats that are n squared integers are ultimately checked an odd number of times.

  # Instead of checking every cat, we can just set a loop that will create squares
  # of i from i = 1 to i = square root of n.
  while i <= Math.sqrt(n)
    result << i ** 2
    i += 1
  end

  result
end

p cats_in_hats
