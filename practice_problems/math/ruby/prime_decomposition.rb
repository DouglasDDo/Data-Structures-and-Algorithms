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
  # real pattern until you hit 5
  extract[2]
  extract[3]

  # Set a var equal to 5 so that you can use the +2, +4 pattern for finding primes
  m = 5

  # The pattern for finding primes after 5 is adding 2 then adding 4, continuously
  # until you get to the prime you're after.
  # This loop will extract the prime m for as many times as it needs to, then
  # update m by adding 2, then extract m again, then update again by adding 4 and so on.
  # As long as m^2 is less than or equal to n,
  while m * m <= n
    p "in"
    extract[m]
    m += 2
    extract[m]
    m += 4
  end

  # This line is for grabbing either primes for when the loop doesn't run at all
  # or for larger primes that remain after extracting all other prime factors
  result << n if n > 1
  # Return the result
  result
end

p prime_decomp 125
p prime_decomp 55902
p prime_decomp 759
