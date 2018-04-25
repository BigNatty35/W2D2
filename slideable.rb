module Slidable
  HORIZANTAL_DIRS = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1]
  ]

  DIAGONAL_DIRS = [
    [-1, 1],
    [1, -1],
    [1, 1],
    [-1, -1]
  ]

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    dia = [[-1, 1], [1, -1], [1, 1], [-1, -1]]
    possible_moves = []
      dia.each do |move|
        n = moves[0]
        m = moves[1]

      7.times do
        possible_moves << [move[0] += n, move[1] += m]
      end
    end
    possible_moves
  end
end
