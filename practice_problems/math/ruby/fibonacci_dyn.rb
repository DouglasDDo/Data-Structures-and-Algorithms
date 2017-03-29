# Objective: Use dynamic programming to find the n'th fibonacci number

def fib_dyn(n)
  # Create a memo to hold values
  result = Array.new
  # Set the first two fib values
  result[0] = 0
  result[1] = 1

  # Fill out the memo with numbers from 2 to n
  (2 .. n).each do |i|
    # For each index, the value will be the sum of the previous two
    result[i] = result[i - 1] + result[i - 2]
  end

  # The values are built
  # Return the value at the n'th index
  result[n]
end
