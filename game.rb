require_relative 'board'
require_relative 'piece'
require_relative 'human_player'

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def to_s
    @board.to_s
  end

end