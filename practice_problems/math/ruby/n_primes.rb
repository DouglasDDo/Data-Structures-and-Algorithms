# Objective: Given a positive integer n, find the first n primes

def n_primes(n)
  # Ensure proper args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0
  # Set result to an array containing 2 since any pos int n will have it in the list
  result = [2]
  # For any pos int greater than 1, 3 will also be included
  # The first two primes don't fit the 6x +/- 1 formula below so they're inserted here
  result << 3 if n > 1

  # Create a lambda fn to check whether any of the results from the 6n +/- 1 formula
  # produce non-primes. If a non-prime shows up it'll have its prime factors in the
  # least before the non-prime is produced.
  counted = Proc.new { |i| result.any? { |j| i % j == 0 } }

  # Start a var at 1 for use in the formula for primes
  i = 1
  # Run a loop until the result size hits n
  until result.size == n
    # After 3, 6x - 1 and 6x + 1 will produce mostly primes for x >= 1.
    # The lambda fn will ignore any non-primes that slip through like when x = 4.
    # For 6x + 1, an extra check condition exists in case 6x - 1 increases result
    # size to n.
    result << (6 * i - 1) unless counted[(6 * i - 1)]
    result << (6 * i + 1) unless result.size == n || counted[(6 * i + 1)]
    i += 1
  end

  result
end

p n_primes 1
p n_primes 3
p n_primes 22
