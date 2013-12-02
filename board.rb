class Board
  ROWS = 8

  attr_accessor :rows

  def initialize
    @rows = Array.new(ROWS) { Array.new(ROWS) }
    set_up(:dark)
    set_up(:light)
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