# Objective: Implement the Fisher-Yates shuffle

def fisher_yates_shuffle(arr)
  # Start of the end limit, n, at the last index of the array
  n = arr.size - 1

  until n == 0
    # Select an index by randomly selecting a number between (and including) 0 and n
    i = rand(0..n)
    # Swap the element at n with the element at i
    arr[i], arr[n] = arr[n], arr[i]
    # Decrement n and loop back again with an end limit that's closer to the start
    n -= 1
  end

  # The array is shuffled so return it
  arr
end

foo = (1..13).to_a
p fisher_yates_shuffle(foo)
