# Objective: Use recursion to find the n'th fibonacci number

def fib_rec(n)
  # Cover the base case when n falls to 0
  return 0 if n == 0
  # There are no numbers to add behind 1 so both n=1 and n=2 should return 1, the
  # starting numbers
  return 1 if n <= 2

  # For the rest, keep decrementing n by 1 and 2 and adding them together
  # This will build up from 1 + 1
  return fib_rec(n - 1) + fib_rec(n - 2)
end

# Time Complexity: O(2 ** n)
