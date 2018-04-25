require_relative 'piece'
require_relative 'display'
require_relative 'cursor'
class Board
  attr_accessor :grid, :null

  def initialize

    @null = NullPiece.new
    @grid = Array.new(8) {Array.new(8) {@null}}
    # @grid[0][0] = Piece.new
    set_up
  end

  def set_up
    (0..1).each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new
      end
    end
    (6..7).each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new
      end
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      check_start_pos(start_pos)
      check_end_pos(end_pos)
    rescue
      puts "invalid, please put a new start and end position"
      start_pos = gets.chomp.split(",").map{|n| n.to_i}
      end_pos = gets.chomp.split(",").map{|n| n.to_i}
      retry
    ensure
      place_piece(start_pos, end_pos)
    end
  end

  def [](pos)
    row = pos.first
    col = pos.last
    @grid[row][col]
  end

  def []=(pos, piece)
    row = pos.first
    col = pos.last
    @grid[row][col] = piece
  end

  def check_start_pos(pos)
    if self[pos].class == NullPiece
      raise NoPieceError.new
    end
  end

  def check_end_pos(pos)
    if self[pos].class == Piece
      raise InvalidMoveError.new
    end
  end

  def place_piece(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @null
  end

  def inspect
    " "
  end

end


class NoPieceError < ArgumentError
  def message
    puts "There is no piece. Please choose a position with a Piece."
  end
end

class InvalidMoveError < ArgumentError
  def message
    puts "You cannot move there."
  end
end

if __FILE__ == $0
  board = Board.new
end
