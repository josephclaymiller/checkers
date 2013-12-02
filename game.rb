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

if __FILE__ == $PROGRAM_NAME
  puts "Checkers"
  game = Game.new
  p game
  p1 = game.board[1,2]
  p2 = game.board[6,3]
  p3 = game.board[7,4]
  p4 = game.board[0,1]
  # King p1
  p1.perform_slide([2,1])
  p2.perform_slide([5,4])
  p1.perform_slide([3,0])
  p2.perform_slide([4,5])
  p1.perform_slide([4,1])
  p3.perform_slide([6,3])
  p1.perform_slide([5,2])
  p3.perform_slide([5,4])
  p1.perform_slide([6,3])
  p1.perform_slide([7,4])
  # king p2
  p2.perform_slide([3,4])
  p4.perform_slide([1,2])
  p2.perform_slide([2,3])
  p4.perform_slide([2,1])
  p2.perform_slide([1,2])
  p4.perform_slide([3,0])
  p2.perform_slide([0,1])
  # Move kings backwards
  p1.perform_slide([6,3])
  p2.perform_slide([1,2])
  # piece jump to take king
  p5 = game.board[0,3]
  p5.perform_jump([2,1])
  # king jump to take piece
  p1.perform_jump([4,5])
end