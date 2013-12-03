class Board
  ROWS = 8

  attr_accessor :rows

  def initialize(starting = true)
    @rows = Array.new(ROWS) { Array.new(ROWS) }
    if starting
      set_up(:dark)
      set_up(:light)
    end
  end

  def [](x, y)
    self.rows[x][y]
  end

  def []=(x, y, el)
    self.rows[x][y] = el
  end

  def set_up(color)
    row1, row2 = 0, 1
    if color == :light
      row1, row2 = ROWS - 1, ROWS - 2
    end
    set_up_rows = [row1, row2]
    ROWS.times do |col|
      set_up_rows.each do |row|
        pos = [row, col]
        self[*pos] = Piece.new(color, pos, self)
      end
    end
    self.rows
  end

  def num_rows
    ROWS
  end

  def pieces
    @rows.flatten.compact
  end

  def dup
    new_board = Board.new(false)
    pieces.each do |piece|
      new_piece = piece.class.new(piece.color, piece.pos, new_board)
      new_board[*piece.pos] = new_piece
    end
    new_board
  end

  def to_s
    board_string = ""
    self.rows.each do |row|
      row.each do |el|
        symbol = (el ? el.to_s : ".")
        board_string << symbol << " "
      end
      board_string << "\n"
    end
    board_string << "\n"
  end

end