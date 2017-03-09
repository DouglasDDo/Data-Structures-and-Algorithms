# Objective: Given a number N greater than 1, find the prime factors of N
# Example: X = 18, fn(X) = [2,3,3]; Y = 28, fn(Y) = [2,2,7]

def prime_decomp(n)
  # Ensure valid args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0
  # Optional and not sure if valid solution but quickly return array with 1 if n == 1
  return [1] if n == 1
  # Keep an empty array to store the results
  result = []

  # Using a proc here because I want to reuse this routine multiple times
  # and also because it's a convenient way to access vars within the larger scope,
  # which is needed to alter n.
  # This is to be used with primes i and should reduce n by as many times as i divides
  # into n; basically it extracts out i the max number of times and inserts i into the
  # results array
  extract = Proc.new { |i|
    # While i still divides into n evenly
    while n % i == 0
      # Push i into the result
      result << i
      # Set n to the remainder after dividing by i
      n = n/i
    end
  }

  # Start out by explicitly calling extract using 2 and 3 since there is no
  # real pattern until after 3
  extract[2]
  extract[3]

  # The formula for finding consecutive primes after 3 is 6x - 1 and 6x - 2 for
  # integers 1 and greater.
  # This loop checks the primes and alters n until n is either 1 or 0, at which
  # point the loop breaks.
  x = 1
  
  while n > 1
    m = 6 * x - 1
    extract[m]
    m = 6 * x + 1
    extract[m]
    x += 1
  end

  # Return the result
  result
end

p prime_decomp 5590210
