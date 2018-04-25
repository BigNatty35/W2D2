require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_accessor :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    curs = @cursor.cursor_pos
      selected = @cursor.selected
    @board.grid.each_with_index do |row, idx|
      row.each_with_index do |col, idx2|
        if [idx, idx2] == curs && !selected
          print "o".colorize(:yellow) + " | "
        elsif [idx, idx2] == curs && selected
            print "o".colorize(:red) + " | " #@board.grid[idx][idx2].to_s
        else
        print @board.grid[idx][idx2].to_s + " | "
        end
      end
      puts ""
    end
    nil
  end

  def move_cursor
    loop do
      system "clear"
      render
      @cursor.get_input
    end
  end

end
