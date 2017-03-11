# Objective: Given a number N, return an array that holds all N-bit binary combinations
# Example: N = 2, Solution = ["00", "01", "10", "11"]

def n_bits(n)
  # Ensure proper args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0

  # Create an empty array to hold results
  result = []
  # Get the max number that can be represented by an n-char binary
  max = (2 ** n) - 1

  # Start from zero and go up to and including the max
  (0 .. max).each do |i|
    # Use a base 2 string conversion of the integer to get its base binary value
    converted = i.to_s(2)

    # Since leading 0's are left off, run a loop while the length of the converted
    # str is less than n
    while converted.length < n
      # Prepend a 0 for each iteration
      converted = "0" + converted
    end

    # Push the final form of the str into the result array
    result << converted
  end

  result
end

p n_bits 3
