class Board
  ROWS = 8

  attr_accessor :rows

  def initialize
    @rows = Array.new(ROWS) { Array.new(ROWS) }
    # set_up(:red)
    # set_up(:black)
  end

  def [](x, y)
    self.rows[x][y]
  end

  def []=(x, y, el)
    self.rows[x][y] = el
  end

  def to_s
    board_string = ""
    self.rows.each do |row|
      row.each do |el|
        symbol = (el ? el : "_")
        board_string << symbol << " "
      end
      board_string << "\n"
    end
    board_string << "\n"
  end

  def set_up(color)
    row1, row2 = 0, 1
    if color == :black
      row1, row2 = ROWS - 1, ROWS - 2
    end
    set_up_rows = [row1, row2]
    ROWS.times do |col|
      set_up_rows.each do |row|
        pos = [row, col]
        next_piece = Piece.new(color, pos)
        self.rows[row, col] = next_piece
      end
    end
    self.rows
  end

end