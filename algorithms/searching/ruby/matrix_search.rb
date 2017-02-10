# Objective: Implement a search that finds an element in an N x M sorted matrix
# containing all integers

# The idea behind this is to find the correct row first, then walk back the column
# on the row where the target is
def matrix_search2(matrix, target)
  # Start at the first row and last column
  # It's easier to check if you're in the right row by going to the last column
  # since if you start at the first of both, you can only increase either or both
  # and the only check you can do is whether the target is greater than the current
  # which it always will be
  row = 0
  col = matrix[0].size - 1

  # Run a loop
  while row < matrix.size && col >= 0
    # Return right away if the target is found (or return in later iterations)
    return  [row,col] if matrix[row][col] == target

    # If the target is less than the current, the row is correct
    if target < matrix[row][col]
      # So walk back the column until target is found
      col -= 1
    else
      # If the target is greater than the current, the row should be increased
      row += 1
    end
  end

  # Return nil if the target isn't there at all
  nil
end

# Time Complexity O(N + M) where N is number of rows and M is number of columns
foo = [[1,2,3],[4,5,6],[7,8,9]]
bar = foo.flatten.sample
p bar
p matrix_search2(foo, bar)
