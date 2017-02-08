# Objective: Find the longest shared substring

def longest_common_sub(str1, str2)
  # End early if one of the strings is empty
  raise ArgumentError, "Non-string argument(s) used." unless str1.is_a?(String) && str2.is_a?(String)
  return '' unless str1.length + str2.length > 1
  # Create a 2D array with the lengths of the strings
  # The first level of this array will keep track of the letters in str1
  # The second level will keep track of whether str2 has a char that matches matrix[i]
  # The values that occupy matrix[i][j] will keep track of the end point for the result
  matrix = Array.new(str1.length) { Array.new(str2.length, 0) }

  # Keep track of end of matching substrings
  max_len = 0
  # Initialize an empty string to record the matching substring
  result = ''

  # For each char in str1
  # Compare with each char in str2
  # matrix[i] holds matches for each char in str1
  # matrix[i][j] holds how far in those matches go in str1
  str1.chars.each_with_index do | n, i |
    str2.chars.each_with_index do | m, j |
      # Move onto the next char until there is a match in both strings
      next unless n == m

      # There is a matching char (otherwise the previous line would've moved the steps forward)
      # The matrix at i at j needs to count at least 1 (so that max_len can mirror it)
      # If both i and j aren't the starting, then account for the previous count
      # even if it's 0, and increment the match count in the matrix
      matrix[i][j] = (i == 0 || j == 0) ? 1 : matrix[i - 1][j - 1] + 1

      # If the new cell value is greater than the current max_len
      # It means that we need to update the max_len so that the result can capture
      # the proper substring
      if matrix[i][j] > max_len
        # Update max_len to show the true max_len
        max_len = matrix[i][j]

        #  i - max_len + 1 will be at least 0
        #  Start slicing at the current i index
        #  Subtract length and add 1 to find the correct starting point
        #  These steps are necessary in case there are multiple smaller previous substrings
        #  Make the slice as long as the max_len
        result = str1.slice(i - max_len + 1, max_len)
      end
    end
  end

  result
end

p longest_common_sub(123, 'dab')
