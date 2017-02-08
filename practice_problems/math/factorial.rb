# Objective: Return factorial n (n!)

def factorial(n)
  return nil unless n.is_a?(Integer)
  n <= 1 ? 1 : (1..n).reduce(:*)
end
