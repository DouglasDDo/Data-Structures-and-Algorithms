# Objective: Determine whether a string is a rotation of another string
# Example: cdab is a rotation of abcd but loco is not a rotation of cool

def easy_rotation?(str1, str2)
  # Cover edge case where one arg isn't a string
  raise ArgumentError, "Non-string argument(s) used." unless str1.is_a?(String) && str2.is_a?(String)
  # Immediately reject arguments without matching lengths
  return false unless str1.length == str2.length

  # Add str1 to itself to hold all possible rotations within one string
  check = str1 + str1

  # Check the doubled up string for str2 and return false if it's not found
  return false unless check.include?(str2)

  true
end
