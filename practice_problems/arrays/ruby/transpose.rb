# Objective: Recreate the #transpose method. Do not use #zip or #transpose.

def my_transpose(matrix)
  result = []

  (0 ... matrix[0].size).each do |i|
    row = []

    (0 ... matrix.size).each do |j|
      row << matrix[j][i]
    end

    result << row
  end

  result
end

matrix = [[1,2,5],
          [1,3,6],
          [1,4,7]]

p 'Original'
matrix.each {|row| p row}
p 'Transposed'
my_transpose(matrix).each {|row| p row}

p 'Test'
p my_transpose(matrix)
p matrix.transpose

# Objective: This time, make the matrix rotate clockwise (not the same as transpose)

def clockwise_rotate(matrix)
  result = []

  (0 ... matrix[0].size).each do |i|
    row = []

    (matrix.size - 1).downto(0) do |j|
      row << matrix[j][i]
    end

    result << row
  end

  result
end
