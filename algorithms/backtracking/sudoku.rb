# Objective: Given N, solve a Sudoku board that is N * N in size.

def sudoku(num)
  raise ArgumentError, "Argument provided must be a positive integer." unless num.is_a?(Integer) && num > 0

  board = Array.new(num) { Array.new(num, 0) }
end

def valid_move?(pos, board)
  row, col = pos

  (0 ... board.size).each do |idx|
    return false unless idx == col || board[row][idx] != board[row][col]
    return false unless idx == row || board[idx][col] != board[row][col]
  end

  sq_size = (board.size / 3)

  row_floor = (row / sq_size) * sq_size
  row_ceil = row_floor + sq_size - 1
  col_floor = (col / sq_size) * sq_size
  col_ceil = col_floor + sq_size - 1

  (row_floor .. row_ceil).each do |r|
    (col_floor .. col_ceil).each do |c|
      # next if [r, c] == [row, col]
      return false if board[r][c] == board[row][col]
    end
  end

  true
end
