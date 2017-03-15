# Objective: Write a fn(x,y) that finds that greatest common denominator

def gcd(x, y)
  # Ensure proper args
  raise ArgumentError, "Argument(s) provided must be integers." unless x.is_a?(Integer) && y.is_a?(Integer)

  # Get the absolute value of x, y in order to account for negative inputs
  x, y = x.abs, y.abs

  # Mod x by y and assign the result to y.
  # Assign the original y value to x.
  # Repeat until y == 0.
  # If y == 0, then y divides evenly into x and x is the gcd.
  # Otherwise, x will eventually equal 1, meaning the original inputs don't
  # divide into each other at all.
  until y == 0
    x, y = y, x % y
  end

  x
end
