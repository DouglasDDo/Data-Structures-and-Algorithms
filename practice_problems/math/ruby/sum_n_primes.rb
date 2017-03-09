# Objective: Given a positive integer n, find the sum of the first n primes

def sum_n_primes(n)
  # Ensure proper args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0
  # Set result to an array containing 2 since any pos int n will have it in the list
  primes = [2]
  # For any pos int greater than 1, 3 will also be included
  # The first two primes don't fit the 6x +/- 1 formula below so they're inserted here
  primes << 3 if n > 1

  # Create a lambda fn to check whether any of the results from the 6n +/- 1 formula
  # produce non-primes. If a non-prime shows up it'll have its prime factors in the
  # least before the non-prime is produced.
  counted = Proc.new { |i| primes.any? { |j| i % j == 0 } }

  i = 1
  until primes.size == n
    # After 3, 6x - 1 and 6x + 1 will produce mostly primes for x >= 1.
    # The lambda fn will ignore any non-primes that slip through like when x = 4.
    # For 6n + 1, an extra check condition exists in case n is odd
    k,m = [ 6 * i - 1, 6 * i + 1]

    primes << k unless counted[k]
    primes << m unless primes.size == n || counted[m]

    i += 1
  end

  primes.reduce(:+)
end

p sum_n_primes 5
