# Objective: Return factorial n (n!)

def factorial(n)
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0

  n <= 1 ? 1 : (1..n).reduce(:*)
end
