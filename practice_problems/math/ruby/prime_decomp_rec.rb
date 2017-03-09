# Objective: Given a number N greater than 1, find the prime factors of N
# using recursion to come to the solution
# Example: X = 18, fn(X) = [2,3,3]; Y = 28, fn(Y) = [2,2,7]

def prime_decomp_rec(n)
  # Ensure proper arguments
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0

  # Find the first value that divides into n
  # Start from 2, the smallest non-1 factor, and go up to n/2, the largest possible factor
  val = (2 .. n/2).find {|i| n % i == 0 }

  # If val is a prime number, the previous line will have set it to nil, falsey
  # Otherwise, put val into its own array and then concat a recursive call to
  # n/val; val will always be a prime
  val ? [val].concat(prime_decomp_rec(n/val)) : [n]
end
