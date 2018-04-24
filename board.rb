require_relative 'piece'

class Board
  attr_accessor :grid

  def initialize

    @null = NullPiece.new
    @grid = Array.new(8) {Array.new(8) {[Piece.new, @null].sample}}

  end

  def move_piece(start_pos, end_pos)
    begin
      check_start_pos(start_pos)

    rescue NoPieceError => noperr
      noperr.message
      puts "enter a new start postion"
      start_pos = gets.chomp.split(",").map{|n| n.to_i}
      retry

      check_end_pos(end_pos)

    rescue InvalidMoveError => inv
      inv.message
      puts "enter a new end position"
      end_pos = gets.chomp.split(",").map{|n| n.to_i}
      retry

    place_piece(start_pos, end_pos)
    end

    puts "hello"

  end

  def check_start_pos(pos)
    if @grid[pos.first][pos.last].is_a?(NullPiece)
      raise NoPieceError.new
    end
  end

  def check_end_pos(pos)
    if @grid[pos.first][pos.last].is_a?(Piece)
      raise InvalidMoveError.new
    end
  end

  def place_piece(start_pos, end_pos)

    piece = @grid[start_pos.first][start_pos.last]
    @grid[end_pos.first][end_pos.last] = piece
    @grid[end_pos.first][end_pos.last] = @null



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
