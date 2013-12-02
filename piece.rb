class Piece

  attr_accessor :pos, :board

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @king = false
    # Pieces can only move one direction until king
    @direction = (@color == :light ? -1 : 1)
  end

  def perform_slide(pos)
    if !((pos[1] - @pos[1]).abs == 1)
      puts "Must move diagonally"
      return false
    end
    if (!@king && ((pos[0] - @pos[0]) != @direction))
      puts "Must move in direction"
      return false
    end
    if !((pos[0] - @pos[0]).abs == 1)
      puts "can only move 1 away"
      return false
    end
    if board[*pos]
      puts "already a piece on board in #{pos}"
      return false
    end
    move(pos)
    true
  end

  def perform_jump(pos)
    move(pos)
    true
  end

  def is_king?
    @king
  end

  def to_s
    piece_string = ""
    case @color
    when :dark
      is_king? ? 'D' : 'd'
    when :light
      is_king? ? 'L' : 'l'
    else
     '?'
    end
  end

  private
  def move(pos)
    board[*pos] = self # add piece to new spot on board
    board[*self.pos] = nil # remove from old spot on board
    self.pos = pos # upate pos
    if maybe_promote
      puts "Kinged"
    end
    p self.board
  end

  def maybe_promote
    king_row = 0
    if @color == :dark
      king_row = self.board.num_rows - 1
    end
    if @pos[0] == king_row
      @king = true
    end
    @king
  end

end