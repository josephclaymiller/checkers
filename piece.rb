class Piece

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @king = false
    # Pieces can only move one direction until king
    @direction = (@color == :light ? 1 : -1)
  end

  def perform_slide(pos)
    return false if !((pos[1] - @pos[1]).abs == 1)
    return false if (!@king && ((pos[0] - @pos[0]) != @direction))
    return false if !((pos[0] - @pos[0]).abs == 1)
    self.maybe_promote
  end

  def perform_jump(pos)
    self.maybe_promote
  end

  def maybe_promote
    king_row = 0
    if @color == :light
      king_row = board.ROWS - 1
    end
    if @pos[0] == king_row
      @king = true
    end
    @king
  end

  def to_s
    case @color
    when :dark
      @king ? 'D' : 'd'
    when :light
      @king ? 'L' : 'l'
    else
      '?'
    end
  end

end