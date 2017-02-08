# Objective: Generate all possible parentheses pairs given N number of pairs

# This function takes a left and right count, which start out as n from the driver
# Temp is used to hold the intermediate string that eventually gets pushed onto
# the result array
def form_parentheses(left, right, temp, result)
  # Cover the base case; If both left and right counts have reached 0
  # push the formed string into the results
  if left == 0 && right == 0
    result << temp
  end

  # The left should be handled first since you can't start a balanced string of
  # parentheses with a closing parentheses.
  # As long as there is a left count, add a left
  if left > 0
    # Add the left here
    temp += '('
    # Make a recursive call but decrement the left count since one was just added
    # to the temp string. Leave the right count unaltered and pass in the altered
    # temp string
    form_parentheses(left - 1, right, temp, result)
    # If the parentheses that was just appended is not removed,
    # when the if statement below this runs, it'll be using an altered version
    # of the temp var with an extra '('
    temp[-1] = ''
  end

  # This if statement makes sure that a right is added whenever there are still
  # matches to be made. Comparing the right to the left, instead of 0, will make sure
  # that rights are only added if a left has already been placed.
  if right > left
    # Add the right to the temp here
    temp += ')'
    # Make a recursive call with a decremented right count and the new temp
    form_parentheses(left, right - 1, temp, result)
  end

  # NOTE: Alternatively, each if statement could be condensed to one line each:
  # Left:   form_parentheses(left - 1, right, temp + '(', result)
  # Right:  form_parentheses(left, right - 1, temp + ')', result)
  # I left the longer versions here because I think it's easier to talk through
  # the steps.

  # All cases have been covered and the result array has been filled so return it
  result
end

def n_parentheses(n)
  # Ensure valid arguments
  raise ArgumentError, "Non-integer argument provided." unless n.is_a?(Integer)
  # Create an empty array for the base result
  result = []
  # Cover the case where n is 0 or less
  return [''] if n <= 0

  # Call the function created earlier and feed it the starting arguments
  form_parentheses(n, n, '', result)
end

p n_parentheses 1
