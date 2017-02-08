# Objective: Given a string with parentheses in it, determine whether
# each opening parenthesis has a matching closing one

def matching?(str)
  # Hand back false if the argument is not a string or if the string is empty
  raise ArgumentError, "Invalid argument(s) used." if !str.is_a?(String) || str.empty?

  # Keep track of opening parentheses
  opening = 0

  # Iterate through the chars in the string
  str.chars.each do |char|
    # Increase the opening count if found
    opening += 1 if char == '('

    # If a closing parenthesis is found
    if char == ')'
      # Return false if there is no matching opening
      # This covers the case where there are too few openings and too many closings
      return false if opening < 1

      # If there is a matching opening, reduce the opening
      opening -= 1
    end
  end

  # If the opening count is higher than 0, there were not enough closings
  # Otherwise, all parentheses have a match so return true
  opening == 0
end
