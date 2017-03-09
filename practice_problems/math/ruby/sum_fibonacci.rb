# Objective: Given a positive integer n, find the sum of the first n fib numbers

def sum_fibonacci(n)
  # Ensure proper args
  raise ArgumentError, "Argument provided must be a positive integer." unless n.is_a?(Integer) && n > 0

  result = []
  result[0] = 0
  result[1] = 1 if n > 1
  result[2] = 1 if n > 2

  unless n == 3
    (3 ... n).each do |i|
      result[i] = result[i - 1] + result[i - 2]
    end
  end

  result.reduce(:+)
end
