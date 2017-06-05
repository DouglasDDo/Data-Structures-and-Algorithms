# Objective:

def fib_sum_dp(n)
  result = []
  result[0] = 0
  result[1] = 1

  (2 .. n).each do |i|
    result[i] = result[i - 1] + result[i - 2]
  end

  result.take(n).reduce(:+)
end
