require_relative 'board'
require_relative 'piece'
require_relative 'human_player'

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    # set_up(:red)
    # set_up(:black)
  end

  def to_s
    @board.to_s
  end


  # def set_up(color)
  #   row1, row2 = 0, 1
  #   if color == :black
  #     row1, row2 = self.board.num_rows - 0, self.board.num_rows - 1
  #   end
  #   set_up_rows = [row1, row2]
  #   self.board.num_rows.times do |col|
  #     set_up_rows.each do |row|
  #       pos = [row, col]
  #       self.board.rows[*pos] = Piece.new(color, pos)
  #     end
  #   end
  # end


end