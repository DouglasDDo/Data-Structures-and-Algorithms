def queensproblem(num):
    solutions = [[]]
    for row in range(num):
        solutions = place_queen(row, num, solutions)
    return solutions

def place_queen(new_row, columns, prev_solutions):
    return [solution + [new_column]
            for solution in prev_solutions
            for new_column in range(columns)
            if no_conflict(new_row, new_column, solution)]

def no_conflict(new_row, new_column, solution):
    return all(solution[row]       != new_column           and
               solution[row] + row != new_column + new_row and
               solution[row] - row != new_column - new_row
               for row in range(new_row))

print queensproblem(4)
