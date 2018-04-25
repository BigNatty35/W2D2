class Piece

  def initialize
    @sym = "♔"

  end

  def to_s
    @sym
  end

  def moves

  end

end

class NullPiece < Piece

  def initialize
    # @moves = moves
    # @symbol = symbol
    @sym = " "
  end

end

class Bishop < Piece
  def initialize
    @sym = "♗"
  end

  def moves
    moves = {
      up_left: [-1, 1],
      up_right: [1, 1],
      down_right: [1, -1],
      down_left: [-1, -1]
    }
  end
end

class Queen < Piece
  def initialize
    @sym = "♕"
  end

  def moves

  end
end

class Rook < Piece
  def initialize
    @sym = "♖"
  end

  def moves

  end
end

class Knight < Piece
  def initialize
    @sym = "♘"
  end

  def moves

  end
end

class King < Piece
  def initialize
    @sym = "♔"
  end
end
