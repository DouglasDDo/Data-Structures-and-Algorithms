# Objective: Place N queens on a chess board with N * N dimensions so that
# none of the queens can collide in one move. Queens can move horizontally, vertically,
# and diagonally the full length of the board. Return the first result or an empty arr.

def n_queens(num = 8)
  # The queens var will hold arrays containing row and col of valid positions
  queens = []

  solvable?(num, 0, queens)

  queens
end

# A utility function to test whether a given pair of coords makes a valid move
def valid_move?(row, col, queens)
  # Go through each of the current valid moves
  queens.each do |q_pos|
    # Grab the coords
    q_row, q_col = q_pos

    # If the coords to be checked land on either the same col or row as an existing
    # valid move, the coords are invalid
    return false if q_row == row || q_col == col
    # Check to see if the slope between the coords and any valid moves is equal to 1.
    # Having a slope of 1 on board means the two points are on the same diagonal line.
    return false if ((row - q_row) / (col - q_col).to_f).abs == 1
  end

  true
end

def solvable?(n, row, queens)
  # The base case for when this fn has gone through all available rows
  return true if n == row

  # On each row, iterate through the col spaces
  (0 ... n).each do |col|
    # If the row and col pair is valid
    if valid_move?(row, col, queens)
      # Push the pair onto the queens array
      queens << [row,col]
      # Make a recursive call with an incremented row and a newly updated queens array
      if solvable?(n, row + 1, queens)
        # Explicitly return true for cases where row + x hasn't yet equaled n
        return true
      else
        # If the recursive call doesn't work for the given row, try going "backwards".
        # Remove the last el of queens to eliminate the results of the previous call.
        queens.pop
      end
    end
  end

  # If the loop above can't place any valid moves, return false
  false
end

p n_queens 4
