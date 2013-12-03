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
  puts "Original board: \n#{game.board}"
  # p1 = game.board[1,2]
 #  p2 = game.board[6,3]
 #  p3 = game.board[7,4]
 #  p4 = game.board[0,1]
 #  # King p1
 #  p1.perform_slide([2,1])
 #  p2.perform_slide([5,4])
 #  p1.perform_slide([3,0])
 #  p2.perform_slide([4,5])
 #  p1.perform_slide([4,1])
 #  p3.perform_slide([6,3])
 #  p1.perform_slide([5,2])
 #  p3.perform_slide([5,4])
 #  p1.perform_slide([6,3])
 #  p1.perform_slide([7,4])
 #  # king p2
 #  p2.perform_slide([3,4])
 #  p4.perform_slide([1,2])
 #  p2.perform_slide([2,3])
 #  p4.perform_slide([2,1])
 #  p2.perform_slide([1,2])
 #  p4.perform_slide([3,0])
 #  p2.perform_slide([0,1])
 #  # Move kings backwards
 #  p1.perform_slide([6,3])
 #  p2.perform_slide([1,2])
 #  # piece jump to take king
 #  p5 = game.board[0,3]
 #  p5.perform_jump([2,1])
 #  # king jump to take piece
 #  p1.perform_jump([4,5])
 #  # Attempt to jump over own piece
 #  p6 = game.board[1,0]
 #  p6.perform_jump([3,2])
 #
 #  # move sequence
 #  game2 = Game.new
 #  p game2
 #  p1 = game2.board[1,2]
 #  pos1 = [2,1]
 #  puts "#{p1} move to #{pos1}"
 #  p p1.perform_moves!(pos1)
 #  pos2 = [3,0]
 #  pos3 = [4,1]
 #  pos4 = [5,2]
 #  move_sequence = [pos2, pos3, pos4]
 #  puts "Move pieces at #{p1.pos} to #{move_sequence}"
 #  p1.perform_moves!(*move_sequence)

  # d1 = game.board[1,0]
  # l1 = game.board[6,1]
  # l2 = game.board[6,3]
  #
  # l1_seq1 = [5,0]
  # l1_seq2 = [4,1]
  #
  # l2_seq1 = [5,2]
  # l2_seq2 = [4,3]
  #
  # d1_seq1 = [2,1]
  # d1_seq2 = [3,0]
  # d1_seq3 = [[5,2],[3,4]]
  #
  # l1.perform_moves!(l1_seq1)
  # l1.perform_moves!(l1_seq2)
  #
  # l2.perform_moves!(l2_seq1)
  # l2.perform_moves!(l2_seq2)
  #
  # d1.perform_moves!(d1_seq1)
  # d1.perform_moves!(d1_seq2)
  # d1.perform_moves!(*d1_seq3)

  # d1 = game.board[1,0]
  # l1 = game.board[6,1]
  # l2 = game.board[6,3]
  #
  # l1_seq1 = [5,0]
  # l1_seq2 = [4,1]
  #
  # l2_seq1 = [5,2]
  # l2_seq2 = [4,3]
  #
  # d1_seq1 = [2,1]
  # d1_seq2 = [3,0]
  # d1_seq3 = [[5,2],[3,4]]
  #
  # l1.valid_move_seq?(l1_seq1)
  # l1.valid_move_seq?(l1_seq2)
  # puts "Original board: \n#{game.board}"

  # l2.valid_move_seq?(l2_seq1)
  # # l2.valid_move_seq?(l2_seq2)
  #
  # d1.valid_move_seq?(d1_seq1)
  # d1.valid_move_seq?(d1_seq2)
  # d1.valid_move_seq?(*d1_seq3)

  #Test perform_moves
  d1 = game.board[1,0]
  l1 = game.board[6,1]
  l2 = game.board[6,3]

  l1_seq1 = [5,0]
  l1_seq2 = [4,1]

  l2_seq1 = [5,2]
  l2_seq2 = [4,3]

  d1_seq1 = [2,1]
  d1_seq2 = [3,0]
  d1_seq3 = [[5,2],[3,4]]

  l1.perform_moves(l1_seq1)
  l1.perform_moves(l1_seq2)

  l2.perform_moves(l2_seq1)
  l2.perform_moves(l2_seq2)

  d1.perform_moves(d1_seq1)
  d1.perform_moves(d1_seq2)
  d1.perform_moves(*d1_seq3)

  #perform invalid move sequence
  d1.perform_moves(d1_seq1)
end