# Objective: Place N queens on a chess board with N * N dimensions so that
# none of the queens can collide in one move. Queens can move horizontally, vertically,
# and diagonally the full length of the board.

def n_queens(num = 8)
  solutions = []
  queens = []

  solve(num, 0, queens, solutions)

  solutions
end

def valid_move?(row, col, queens)
  queens.each do |q_pos|
    q_row, q_col = q_pos

    return false if q_row == row || q_col == col
    return false if ((row - q_row) / (col - q_col).to_f).abs == 1
  end

  true
end


def solve(n, row, queens, sol)

end

n_queens(4).each {|x| p x}
# p n_queens 4
