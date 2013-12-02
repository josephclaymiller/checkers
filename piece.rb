class Piece

  attr_accessor :pos, :board, :color

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @king = false
    # Pieces can only move one direction until king
    @direction = (@color == :light ? -1 : 1)
  end

  def perform_slide(pos)
    valid_slide = is_valid_slide?(pos) # check if valid slide
    move(pos) if valid_slide
    valid_slide
  end

  def perform_jump(pos)
    # Find piece jumped over
    middle_x = self.pos[0] + ((pos[0] - self.pos[0]) / 2)
    middle_y = self.pos[1] + ((pos[1] - self.pos[1]) / 2)
    middle_pos = [middle_x, middle_y]

    valid_jump = is_valid_jump?(pos, middle_pos) # check if valid jump
    if valid_jump
      # remove piece jumped over
      self.board[*middle_pos] = nil
      puts "Removed piece at #{middle_pos}"
      move(pos)
    end
    valid_jump
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

  def is_valid_slide?(pos)
    row_diff = (pos[0] - self.pos[0])
    col_diff = (pos[1] - self.pos[1])
    unless (row_diff.abs == 1) && (col_diff.abs == 1)
      puts "Must slide 1 space diagonally"
      return false
    end
    if !is_king? && (row_diff != @direction)
      puts "Must slide in direction"
      return false
    end
    if self.board[*pos]
      puts "already a piece on board in #{pos}"
      return false
    end
    true
  end

  def is_valid_jump?(pos, middle_pos)
    row_diff = (pos[0] - self.pos[0])
    col_diff = (pos[1] - self.pos[1])
    unless (row_diff.abs == 2) && (col_diff.abs == 2)
      puts "Must jump 2 spaces diagonally"
      return false
    end
    if !is_king? && (row_diff != @direction * 2)
      puts "Must jump in direction"
      return false
    end
    unless self.board[*middle_pos]
      puts "no piece on board at #{middle_pos} to jump over"
      return false
    end
    if self.board[*middle_pos].color == self.color
      puts "Can not jump own pieces"
      return false
    end
    true
  end

  def move(pos)
    board[*pos] = self # add piece to new spot on board
    board[*self.pos] = nil # remove from old spot on board
    self.pos = pos # upate pos
    if maybe_promote
      puts "Kinged at #{pos}"
    end
    p self.board
  end

  def maybe_promote
    king_row = (@color == :dark ? (self.board.num_rows - 1): 0)
    if !is_king? && @pos[0] == king_row
      @king = true
    else
      false
    end
  end

end