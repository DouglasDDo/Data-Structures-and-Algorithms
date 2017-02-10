# Objective: Find the square root of a number manually, without sqrt
# NOTE: This will only find the nearest integer square root after rounding down

def sq_root(num)
  # Disregard negative numbers
  return nil if num < 0
  # 0 and 1 are square roots of themselves
  return num if num <= 1

  # Initialize the starting floor
  min = 0
  # Initialize the starting ceiling; sqrt can't be higher than half of num + 1
  max = ((num/2) + 1)

  # Loop through the values between min and max
  # Adjust either min or max depending on whether their difference halved and then
  # squared is equal to num
  while (min + 1 < max)
    # Find the mid point
    mid = (min + (max - min)/2)
    # Square the mid point
    square = (mid ** 2)

    # If the square value is equal to num, we're done, return mid as sqrt
    if square == num
      return mid
    # If the square value is lower than num, the min value is too low
    # Set min to mid
    elsif square < num
      min = mid
    # Otherwise, the square value is higher than num and the max is too high
    # Set the max to the mid value
    else
      max = mid
    end
  end

  # Return the min value (for values rounded down)
  # Alternatively, you could return max value for the integer rounded up
  max
end
