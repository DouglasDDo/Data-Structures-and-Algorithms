
def fibonacci_search(arr, target)
  # Ensure valid arguments
  raise ArgumentError, "First argument must be an array." unless arr.is_a?(Array)
  raise ArgumentError, "The array given must contain only integer values." unless arr.all? {|el| el.is_a?(Integer)}
  raise ArgumentError, "The target given must be an integer value." unless target.is_a?(Integer)
  # Cover the easy case of empty
  return nil if arr.size == 0

  # Initialize the Fibonacci numbers
  fib_low = 1 # Fib(m - 2) => *1, 1, 2
  fib_mid = 1 # Fib(m - 1) => 1, *1, 2
  fib_high = fib_low + fib_mid # Fib(m) => 1, 1, *2

  # Find the smallest Fibonacci number that's greater than the arr size and
  # the two trailing Fibonacci numbers behind it
  until fib_high >= arr.size
    fib_low = fib_mid
    fib_mid = fib_high
    fib_high = fib_low + fib_mid
  end

  # Initialize the offset at 0.
  # In the loop below, if the target is higher than the el at current_idx, it means
  # the indices below the current_idx no longer need to be considered. Later iterations
  # of the loop will offset an increasingly shrinking mid fib number with this var.
  offset = 0

  # Keep (most) fib numbers non-negative by setting a floor for fib_low at 0.
  # If fib low is allowed to drop below 0, the fib_low calculation at the end of
  # the loop will make it drop astronomically lower, which then makes fib_mid rise
  # much higher, and fib_high drop much lower also.
  while fib_low >= 0 do
    # Keep current index below upper bound of array size. If offset + mid fib get
    # larger than the last index, the last index is used instead.
    current_idx = offset + fib_mid < arr.size - 1 ? offset + fib_mid : arr.size - 1

    # If the current index drops below 0, it means that the target is either lower
    # than the lowest element in the array, at index 0, OR lower than the
    # offset lower bound. Since the target isn't in the array, return nil.
    return nil if current_idx < 0
    # Preempt the if-else portion and return the current index right away if that's
    # where the target is.
    return current_idx if arr[current_idx] == target

    # If the target is lower than the el at current index:
    if target < arr[current_idx]
      # Shift the fib numbers down by one fib round.
      fib_high = fib_mid
      fib_mid = fib_low
    # Otherwise, the target is higher than the current el so:
    else
      # Jump down two fib rounds. It's possible to only jump down by one fib round
      # and still get the correct result but it makes the function work with a larger
      # range of possible indices.
      fib_high = fib_low
      fib_mid = fib_mid - fib_low

      # Since current index must be within 0 .. n - 1, and since offset is only
      # set by having current index assigned to it, offset will always increase.
      # The offset sets the lower bound for each iteration, reducing the range within
      # which the target index can be found. It's set to current index because if
      # the function has gotten to this point, it's already settled that target is
      # greater than arr at current index.
      offset = current_idx
    end

    # The lowest fib number is determined the same way, regardless of where the
    # target lies relative to the current el
    fib_low = fib_high - fib_mid
  end

  # If the function reaches this point, it means that the target was neither
  # below the arr range nor within it. The target is then beyond the ceiling of the
  # array and so nil is returned.
  nil
end

# p "LOWER Low #{fib_low} Mid #{fib_mid} High #{fib_high}   Off #{offset} Cr #{current_idx} Arr@i #{arr[current_idx]}"
# p "HIGHER Low #{fib_low} Mid #{fib_mid} High #{fib_high}   Off #{offset} Cr #{current_idx} Arr@i #{arr[current_idx]}"
foo = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100, 101, 103, 123, 234, 345]
p fibonacci_search(foo, 44)
p fibonacci_search(foo, 4)
p fibonacci_search(foo, -44)
p fibonacci_search(foo, 99)
p fibonacci_search(foo, 544)
count = []
foo.each {|el| p "#{el} : #{fibonacci_search(foo, el)}"  }
